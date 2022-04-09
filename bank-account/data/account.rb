class Account
  attr_reader :id
  attr_reader :balance

  def initialize(id:)
    @id      = id
    @balance = 0
  end

  def increment(cents:)
    @balance += cents
  end

  def decrement(cents:)
    @balance -= cents
  end
end