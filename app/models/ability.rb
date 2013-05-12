class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)


    if user.is_admin?
      can :manage, :all
      can :assign_roles, User
    elsif user.is_member? 
      can [:read, :create], :all
      # manage projects they own
      can [:manage], Project do |project|
        project.try?(:owner) == user
      end
      # manage their own user
      can [:manage], Users do |user|
        user == user
      end
    else          
      can :read, :all
    end
  end
end
