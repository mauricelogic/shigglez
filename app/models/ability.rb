class Ability
  include CanCan::Ability

    def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :Admin
      can :manage, :all
      can :publish, Restroom
    elsif user.role? :Moderator
      can :read, [Restroom, Review]
      can [:edit, :update], Review
    elsif user.role? :Member
       can :read, :all
       can :create, [Restroom, Review]
       can [:edit, :update], Review
    end
  end
end