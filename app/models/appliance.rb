class Appliance < ApplicationRecord
  belongs_to :kitchen
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :appliance_comments

  alias_attribute :comments, :appliance_comments

  enum category: %i[basic extra]
  enum status: %i[operational broken]

  include ApplianceStateMachine

  def self.actions
    Appliance.aasm.events.map(&:name)
  end

  def valid_actions
    Appliance.actions.select { |e| send("may_#{e}?") }
  end

  def valid_action?(transition)
    valid_actions.include? transition
  end
end
