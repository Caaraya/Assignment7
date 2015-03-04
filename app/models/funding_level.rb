class FundingLevel < ActiveRecord::Base
  belongs_to :project
  has_many :pledges
  validates :project, :presence => true
  validates :reward_name, length: { minimum: 3 }
  validates :amount, numericality: { greater_than: 0 }
end
