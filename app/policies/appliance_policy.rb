class AppliancePolicy < ApplicationPolicy
  def update?
    super and (record.owner == user or user.admin?)
  end

  def destroy?
    user.present? and (record.owner == user or user.admin?)
  end
end
