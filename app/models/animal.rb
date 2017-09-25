class Animal < ApplicationRecord
	validates_presence_of :name, :terrain

	has_many :animal_projects, dependent: :destroy
	has_many :projects, through: :animal_projects
end
