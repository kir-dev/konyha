class Appliance < ApplicationRecord
  belongs_to :kitchen
  has_many :appliance_comments

  alias_attribute :comments, :appliance_comments

  enum category: %i[basic extra]
  enum status: %i[operational broken]
end
