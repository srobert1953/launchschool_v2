# expense_data.rb

require 'pg'

class ExpenseData
  def initialize
    @connection = PG::Connection.new(dbname: 'expenses')
  end

  def display_help
    puts "An expense recording system"
    puts ""
    puts "Commands:"
    puts ""
    puts "add AMOUNT MEMO [DATE] - record a new expense"
    puts "clear - delete all expenses"
    puts "list - list all expenses"
    puts "delete NUMBER - remove expense with id NUMBER"
    puts "search QUERY - list expenses with a matching memo field"
  end

  def list_expenses
    all_expenses = @connection.exec 'SELECT * FROM expenses'

    display_expenses all_expenses
  end

  def add_expense(amount, memo)
    today = Date.today
    @connection.exec_params("INSERT INTO expenses (amount, memo, created_on) 
                             VALUES ($1, $2, $3)", [amount, memo, today])
    puts "Your expense was added"
  end

  def search_expense(term)
    sql = "SELECT * FROM expenses WHERE memo ILIKE $1"
    result = @connection.exec_params(sql, ["%#{term}%"])

    display_expenses result
  end

  private 

  def display_expenses(expenses)
    expenses.each do |tuple|
      row = [ tuple['id'].rjust(3),
              tuple['created_on'].rjust(10),
              tuple['amount'].rjust(12),
              tuple['memo'] ]
      puts row.join(" | ")
    end
  end
end