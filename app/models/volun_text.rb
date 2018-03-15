class VolunText < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :body

  def should_generate_new_friendly_id?
    title_changed? || super
  end
end
