class Kitchen < ApplicationRecord
  has_many :appliances

  validates :floor, uniqueness: true
end
