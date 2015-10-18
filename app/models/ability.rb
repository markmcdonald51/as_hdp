class Ability
  include CanCan::Ability

  def initialize(current_user)
    as_action_aliases
      current_user ? user_rules(current_user) : guest_rules
      base_rules
  end

  def user_rules(user)
      #user.roles.each do |role|
      exec_role_rules(user.role)
     #end
     default_user_rules
  end

  def default_user_rules
    can :manage, :all #[Attachment, Category, Person, Item, ItemCategory]
  end

  def guest_rules
    can :read, :all
    #can :manage, :all
  end

  def basic_rules
    can :read, :all
    #can :manage, :all
  end


  def exec_role_rules(role)
    meth = :"#{role}_rules"
    send(meth) if respond_to? meth
  end

  def admin_rules
    #can :manage, [Attachment, Category, Person, Item, ItemCategory, User]
    can :manage, :all
  end


  # these are the rules for ALL users and will be appended to whatever
  # the current rules the users has...
  def base_rules
      #can :manage, [Attachment, Category, Person, Item, ItemCategory]
  end



=begin
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
=end

end
