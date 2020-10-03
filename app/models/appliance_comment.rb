class ApplianceComment < ApplicationRecord
  belongs_to :appliance

  enum category: %i[fix note break]

  validates :category, presence: true

  before_save :update_appliance_status

  def available_actions
    appliance.valid_actions.push :note
  end

  private

  def update_appliance_status
    begin
      appliance.send((category + '!').to_sym) if appliance.valid_action?(category.to_sym)
    rescue AASM::InvalidTransition
      errors.add(:category, :invalid)

      raise ActiveRecord::RecordInvalid
    end
  end
end
