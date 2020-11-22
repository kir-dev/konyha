class NilClassPolicy < ApplicationPolicy
  def show?
    false
  end

  alias index? show?
  alias create? show?
  alias new? show?
  alias update? show?
  alias edit? show?
  alias destroy? show?
end