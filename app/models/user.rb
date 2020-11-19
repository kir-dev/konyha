class User < ApplicationRecord
  has_many :appliances
  has_many :appliance_comments
  has_many :kitchen_assignments
  has_many :assigned_kitchens, through: :kitchen_assignments, source: :kitchen
end
