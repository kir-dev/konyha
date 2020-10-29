class UserPolicy < ApplicationPolicy

  def index?
    user.present? and user.admin?
  end

  def show?
    user.present? and (user.admin? or record == user)
  end

  def update?
    user.present? and (user.admin? or record == user)
  end

  def create?
    false
  end

  def destroy?
    false
  end

end
