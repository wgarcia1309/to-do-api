class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login, :update]

    # REGISTER
    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
  
    # LOGGING IN
    def login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end

    # UPDATE
    def update
      
      if  @user.update(user_params)
        render json: {user: @user}
      else
        render json: {error: "Something went wrong"}
      end
    end
  
  
    def auto_login
      render json: @user
    end
     
    def recovery
      user = User.find_by(email: params[:email])
      if user.present?
        PasswordJob.perform_later(user)
      end
      render json:{message:"If the email exist we'll send a link to reset the password"}
    end

    private

    def user_params
      params.permit(:email, :password, :profile_pic)
    end

end
