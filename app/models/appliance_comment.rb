class ApplianceComment < ApplicationRecord
  belongs_to :appliance
  has_one_attached :image

  enum category: %i[fix note break]

  validates :category, presence: true

  before_save :update_appliance_status

  def available_actions
    appliance.valid_actions.push :note
  end

  def compact_body
    body.truncate(30)
  end

  def thumb_nail
    image.variant(resize_and_pad: [200, 200])
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
