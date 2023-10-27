class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest

    can :manage, Recipe, user_id: user.id
  end
end
