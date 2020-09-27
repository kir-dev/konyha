class Appliance < ApplicationRecord
  belongs_to :kitchen
  enum category: %i[basic extra]
  enum status: %i[operational broken]
end
