class Project < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged
  
  def should_generate_new_friendly_id?
    title_changed? || super
  end

  validates_presence_of :title, :preview, :summary, :qualification, :work, :accomodation,
  											:costs, :address, :min_weeks, :costs_week, :accom_standard

  has_many :accom_projects, dependent: :destroy
  has_many :accoms, through: :accom_projects
  has_many :animal_projects, dependent: :destroy
  has_many :animals, through: :animal_projects
  has_many :country_projects, dependent: :destroy
  has_many :countries, through: :country_projects
  has_many :project_tasks, dependent: :destroy
  has_many :tasks, through: :project_tasks

  scope :order_by_title, -> { order(:title).all }

end