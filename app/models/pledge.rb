class Pledge < ActiveRecord::Base
  belongs_to :project
  validates :name, :email, :presence => true
  validates :amount, numericality: { greater_than: 0 }
end
