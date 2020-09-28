class ApplianceComment < ApplicationRecord
  belongs_to :appliance

  enum category: %i[fix note problem]
end
