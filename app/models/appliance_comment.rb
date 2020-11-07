class ApplianceComment < ApplicationRecord
  belongs_to :appliance
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_one_attached :image

  enum category: %i[fix note break damage]

  validates :category, presence: true

  def available_actions
    appliance.valid_actions.push :note
  end

  def compact_body
    body.truncate(30)
  end

  def image
    return '/default/comment.jpg' unless super.attached?

    super
  end
end
