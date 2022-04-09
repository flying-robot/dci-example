require_relative 'data/account'
require_relative 'roles/source_account'
require_relative 'roles/destination_account'
require_relative 'context/bad_standing_error'
require_relative 'context/insufficient_funds_error'
require_relative 'context/transfer_funds'

puts 'Use Case: Transferring funds between accounts, insufficient funds'

src = Account.new(id: 1)
dst = Account.new(id: 2)
ctx = TransferFunds.new()

begin
  ctx.transfer(src: src, dst: dst, cents: 1000)
  puts src.balance
  puts dst.balance
rescue => e
  puts e
end

puts '------------------------------------------------------------------'

puts 'Use Case: Transferring funds between accounts, bad standing'

src = Account.new(id: 1)
dst = Account.new(id: 2)
ctx = TransferFunds.new()

src.increment(cents: 10_000)

begin
  ctx.transfer(src: src, dst: dst, cents: 1000)
  puts src.balance
  puts dst.balance
rescue => e
  puts e
end

puts '------------------------------------------------------------------'

puts 'Use Case: Transferring funds between accounts, success'

src = Account.new(id: 1)
dst = Account.new(id: 2)
ctx = TransferFunds.new()

src.increment(cents: 10_000)
dst.increment(cents: 20_000)

begin
  ctx.transfer(src: src, dst: dst, cents: 1000)
  puts src.balance
  puts dst.balance
rescue => e
  puts e
end
