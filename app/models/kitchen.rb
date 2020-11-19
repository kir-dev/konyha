class Kitchen < ApplicationRecord
  has_many :appliances
  has_many :kitchen_assignments
  has_many :kitchen_admins, through: :kitchen_assignments, source: :user

  validates :floor, uniqueness: true
end
