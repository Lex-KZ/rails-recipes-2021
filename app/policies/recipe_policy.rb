class RecipePolicy < ApplicationPolicy
  def edit?
    user == record.user
  end
end