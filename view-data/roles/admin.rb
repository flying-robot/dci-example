module Admin
  def can_view_sensitive_information?
    true
  end

  def self.extended(base)
    puts "ALERT: #{base.name} ID: #{base.id} extended with admin role"
  end
end
