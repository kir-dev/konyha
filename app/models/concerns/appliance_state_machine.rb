module ApplianceStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :status, enum: true do
      state :operational, initial: true
      state :broken

      event :brake do
        transitions from: :operational, to: :broken
      end

      event :fix do
        transitions from: :broken, to: :operational
      end
    end
  end
end
