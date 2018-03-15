class Task < ApplicationRecord
	validates_presence_of :name, :category

	has_many :project_tasks, dependent: :destroy
	has_many :projects, through: :project_tasks
end
