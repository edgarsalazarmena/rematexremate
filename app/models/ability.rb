class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.seller?
      can :manage, Product, user_id: user.user_id
      can :read, :all
    elsif user.user?
      can :manage, Bid, user_id: user.user_id
      can :read, :all
    elsif user.guest?
      can :read, :all
    end
  end
end
   