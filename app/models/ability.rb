class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)


    if user.is_admin?
      can :manage, :all
      can :assign_roles, User
      can :assign_stages, Project
    elsif user.is_member? 
      can [:read, :create], :all
      # manage projects they own
      can [:manage], Project do |project|
        project.try(:owner) == user
        user.is_project_member? project
      end
      # change projects stage
      can :assign_stages, Project do |project|
        project.try(:owner) == user
      end
      # manage their own user
      can [:manage], Users do |user|
        ap current_user
        current_user == user
      end
    else          
      can :read, :all
    end
  end
end
