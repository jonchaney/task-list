class Dependency < ApplicationRecord
    validates :task_id, presence: true
    validates :dependency_id, presence: true

    belongs_to :task
end
