class Kitchen < ApplicationRecord
  has_many :appliances
  has_many :kitchen_assignments
  has_many :users, through: :kitchen_assignments

  validates :floor, uniqueness: true
end
