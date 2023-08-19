class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :read, Recipe, public: true
      can :manage, Recipe, user_id: user.id
      can :manage, RecipeFood
      can :manage, Food, user_id: user.id
    end
  end
end
