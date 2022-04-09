class BadStandingError < StandardError
  def initialize(msg='Destination account is in bad standing')
    super
  end
end
