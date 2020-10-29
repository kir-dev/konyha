class AppliancePolicy < ApplicationPolicy

  def update?
    super and record.owner == user
  end


end
