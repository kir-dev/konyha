class User < ApplicationRecord
  has_many :appliances
  has_many :appliance_comments
end
