class InsufficientFundsError < StandardError
  def initialize(msg='Insufficient funds in source account')
    super
  end
end
