class Event < ApplicationRecord
	  scope :by_active_status, -> { where("start_date > ?", DateTime.now) }
	  has_and_belongs_to_many :users
	  has_and_belongs_to_many :speakers
	  has_and_belongs_to_many :sponsors
end
