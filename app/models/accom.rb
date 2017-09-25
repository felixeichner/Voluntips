class Accom < ApplicationRecord
	validates_presence_of :name, :category

	has_many :accom_projects, dependent: :destroy
	has_many :projects, through: :accom_projects
end
