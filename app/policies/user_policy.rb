class UserPolicy < ApplicationPolicy
  def index?
    user.present? and user.admin?
  end

  def show?
    user.present?
  end

  def update?
    user.present? and (user.admin? or record == user)
  end
end
