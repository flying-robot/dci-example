module SourceAccount
  # Returns true if the account can satisfy a transfer.
  def has_sufficient_funds?(cents:)
    self.balance - cents > 0
  end
end
