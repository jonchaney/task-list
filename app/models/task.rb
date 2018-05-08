class Task < ApplicationRecord
    validates :name, presence: true
    belongs_to :group
    has_many :dependencies
end
