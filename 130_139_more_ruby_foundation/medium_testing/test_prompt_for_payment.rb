require 'minitest/autorun'

require_relative 'transaction'

class TransactionMethodOveride < Transaction
  def prompt_for_payment(input: $stdin)
    loop do
      puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f
      break if valid_payment? && sufficient_payment?
      puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end
end

class TransactionTest < MiniTest::Test
  def test_test_prompt_for_payment
    transaction = TransactionMethodOveride.new(30)
    input = StringIO.new('30\n')
    capture_io do
      transaction.prompt_for_payment(input: input)
    end
    assert_equal 30, transaction.amount_paid
  end
end
