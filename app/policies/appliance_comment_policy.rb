class ApplianceCommentPolicy < ApplicationPolicy

  def update?
    super and (record.owner == user or user.admin? or floor_admin?)
  end

  def destroy?
    user.present? && (user.admin? or floor_admin?)
  end

  private

  def floor_admin?
    record.appliance.kitchen.kitchen_admins.include?(user)
  end

end
