class Project < ActiveRecord::Base
	has_many :pledges, :funding_levels
	validates :description, :presence => true
	validates :name, length: { minimum: 3 }
end
