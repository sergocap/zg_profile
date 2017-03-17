class Ability
  include CanCan::Ability

  def initialize(user, namespace)
    case namespace
    when 'Manage'
      return unless user
      can :manage, :all if user.has_role? :admin
    else
    end
  end
end
