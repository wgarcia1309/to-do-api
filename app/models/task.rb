class Task < ApplicationRecord
    belongs_to :user
    validates  :title, :status, :presence => true
end
