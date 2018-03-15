class Country < ApplicationRecord
	validates_presence_of :name, :region1

	has_many :country_projects, dependent: :destroy
	has_many :projects, through: :country_projects
end
