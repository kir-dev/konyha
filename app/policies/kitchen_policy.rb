class KitchenPolicy < ApplicationPolicy
  def create?
    false
  end

  def update?
    super and (user.admin? or floor_admin?)
  end

  def destroy?
    false
  end

  private

  def floor_admin?
    record.kitchen_admins.include?(user)
  end

end
