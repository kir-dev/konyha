class KitchenPolicy < ApplicationPolicy

  def create?
    false
  end

  def update?
    super and user.admin?
  end

  def destroy?
    false
  end

end
