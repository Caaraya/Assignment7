class Pledge < ActiveRecord::Base
  belongs_to :project
  belongs_to :funding_level
  validates :name, :presence =>true
  validates :email, :presence => true
  validates :amount, numericality: { greater_than: 0 }
end
