# cli.rb

require_relative 'expense_data'

class CLI
  def initialize
    @data = ExpenseData.new
  end

  def run(args)
    case args.first
    when 'list'
      @data.list_expenses
    when 'add'
      amount = args[1]
      memo = args[2]
      abort "Please enter AMOUNT and MEMO" unless amount && memo
      @data.add_expense(args[1], args[2])
    when 'search'
      term = args[1]
      abort "Please provide a search term" unless term
      @data.search_expense(term)
    when 'delete'
      expense_id = args[1]
      abort "Please provide an expense id" unless expense_id
      @data.delete_expense(expense_id)
    when 'clear'
      @data.delete_all_expenses
    else
      @data.display_help
    end
  end
end
