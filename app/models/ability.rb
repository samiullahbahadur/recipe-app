class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, Recipe, public: true
      can :manage, Food, user_id: user.id
      can :manage, Recipe, user_id: user.id
    end
  end
end
