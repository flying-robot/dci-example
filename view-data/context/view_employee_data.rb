class ViewEmployeeData
  attr_reader :actor

  def initialize(actor:)
    @actor = actor
  end

  def view_sensitive_information
    # By default, restrict all actors to least privileges.
    actor.extend(User)

    # If the actor is a superuser, give them privileges.
    actor.extend(Admin) if actor.id == 1

    # Bail out if they don't have sufficient privileges.
    raise StandardError, 'insufficient privileges' unless
      actor.can_view_sensitive_information?

    # They can have the knowledge!
    "What do you get if you multiply six by nine?"
  end
end
