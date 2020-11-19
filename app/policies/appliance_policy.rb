class AppliancePolicy < ApplicationPolicy

  def update?
    super and (record.owner == user or user.admin? or floor_admin?)
  end

  def destroy?
    user.present? and (record.owner == user or user.admin? or floor_admin?)
  end

  def update_status?
    user.present? and (user.admin? or floor_admin?)
  end

  private

  def floor_admin?
    record.kitchen.kitchen_admins.include?(user)
  end

end
