class ApplianceCommentPolicy < ApplicationPolicy
  def update?
    super and (record.owner == user or user.admin?)
  end
end
