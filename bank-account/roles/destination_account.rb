module DestinationAccount
  # Returns true if the account has a positive balance.
  def in_good_standing?
    self.balance > 0
  end
end
