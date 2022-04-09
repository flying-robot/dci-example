class TransferFunds
  # Moves funds from one account to another.
  def transfer(src:, dst:, cents:)
    # Contextualize the basic account entity with roles.
    src.extend(SourceAccount)
    dst.extend(DestinationAccount)

    # Guard against common failure modes.
    raise InsufficientFundsError unless src.has_sufficient_funds?(cents: cents)
    raise BadStandingError       unless dst.in_good_standing?

    # Perform the interaction.
    # Transfers the given cents amount to the destination.
    src.decrement(cents: cents)
    dst.increment(cents: cents)
  end
end
