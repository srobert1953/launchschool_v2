class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

acc = BankAccount.new(32)
p acc.positive_balance?

acc_2 = BankAccount.new(-45)
p acc_2.positive_balance?
