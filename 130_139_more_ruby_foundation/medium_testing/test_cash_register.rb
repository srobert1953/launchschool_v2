require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TestCashRegister < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(500)
    @transaction = Transaction.new(10)
  end

  def test_accept_money
    @transaction.amount_paid = 10
    @cash_register.accept_money(@transaction)

    assert_equal(510, @cash_register.total_money)
  end

  def test_register_change
    @transaction.amount_paid = 30

    assert_equal(20, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $10.\n") do
      @cash_register.give_receipt(@transaction)
    end
  end

end
