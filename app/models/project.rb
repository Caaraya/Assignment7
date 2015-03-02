class Project < ActiveRecord::Base
	has_many :pledges
	has_many :funding_levels
	validates :description, :presence => true
	validates :name, length: { minimum: 3 }
end
