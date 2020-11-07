module ApplianceStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :status, enum: true do
      state :operational, initial: true
      state :damaged
      state :broken

      event :break do
        transitions from: %i[operational damaged], to: :broken
      end

      event :damage do
        transitions from: :operational, to: :damaged
      end

      event :fix do
        transitions from: %i[broken damaged], to: :operational
      end
    end
  end
end
