class ApplianceComment < ApplicationRecord
  belongs_to :appliance

  enum category: %i[fix note problem]

  validates :body, length: {maximum: 500}
  validates :category, inclusion: {in: ApplianceComment.categories}
end
