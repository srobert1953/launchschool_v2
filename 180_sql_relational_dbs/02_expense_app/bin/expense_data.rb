# expense_data.rb

require 'pg'
require 'IO/console'

class ExpenseData
  def initialize
    @connection = PG::Connection.new(dbname: 'expenses')
    setup_schema
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

  def delete_expense(expense_id)
    sql_select = "SELECT * FROM expenses WHERE id = $1"
    result = @connection.exec_params(sql_select, [expense_id])

    if result.ntuples == 1
      sql_delete = "DELETE FROM expenses WHERE id = $1"
      @connection.exec_params(sql_delete, [expense_id])

      puts "The following expense was deleted"
      display_expenses result
    else
      puts "There is no expense with id #{expense_id}"
    end    
  end

  def delete_all_expenses
    puts "This will remove all expenses, are you sure? (y/n)"
    answer = IO.new(1).getch
    
    @connection.exec("DELETE FROM expenses") if answer == 'y'
  end

  private 

  def display_expenses(expenses)
    if expenses.ntuples > 0
      display_expenses_format(expenses)
    else
      puts 'There are no expenses'
    end
  end

  def display_expenses_format(expenses)
    puts "There are #{expenses.ntuples} expenses"
    expenses.each do |tuple|
      row = [ tuple['id'].rjust(3),
              tuple['created_on'].rjust(10),
              tuple['amount'].rjust(12),
              tuple['memo'] ]
      puts row.join(" | ")
    end
    puts '-' * 50
    total_amount = count_expenses_amount(expenses)
    puts "Total".ljust(15) + total_amount.to_s.rjust(16)
  end

  def count_expenses_amount(expenses)
    expenses.map { |tuple| tuple['amount'].to_f }.inject(&:+)
  end

  def setup_schema
    sql = "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'expenses';"
    result = @connection.exec(sql)

    create_expenses_table unless result.field_values('count').first == "1"
  end

  def create_expenses_table
    @connection.exec <<~SQL
      CREATE TABLE expenses (
        id serial PRIMARY KEY,
        amount decimal(6,2) NOT NULL,
        memo text NOT NULL,
        created_on date NOT NULL DEFAULT NOW(),
        CHECK (amount >= 0.0)
      );
    SQL
  end
end
