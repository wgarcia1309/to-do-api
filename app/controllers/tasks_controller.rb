class TasksController < ApplicationController
    before_action :authorized
    
    # CREATE NEW TASK
    def create
        task = Task.create(task_params)
        task.update(user_id:@user.id)
        if task.valid?
          render json: {taks: task}
        else
          render json: {error: "Invalid task"}, status: :bad_request
        end
    end

    # GET ALL TASK FROM USER
    def index
        tasks = Task.where(user_id: @user.id)
        render json: {tasks: tasks}
    end

    # UPDATE
    def update
        task = Task.find_by(user_id: @user.id, id: task_params[:id])
        if task.present? && task.update(task_params)
            render json: {user: task}
        else
            render json: {error: "something went wrong"}
        end
    end

    # DELETE
    def destroy
        task = Task.find_by(user_id: @user.id, id: task_params[:id])
        if  task.present? && task.destroy
            render json: {message: "task deleted"}
        else
            render json: {error: "something went wrong"}
        end
    end

    # DELETE
    def delete
        puts tasks_delete[:task]
        render json: {message: "asd"}
    end



    private
    
    def tasks_delete
        params.require(:task).permit(:id,:task)
    end  

    def task_params
      params.permit(:status, :description, :title,:deadline,:id)
    end

end
