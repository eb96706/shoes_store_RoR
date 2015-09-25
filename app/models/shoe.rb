class Shoe < ActiveRecord::Base

  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"

  validates :amount, :name, :seller, presence: true
  validates :amount, numericality: {greater_than:0, message: "must be as a positive"}

end
