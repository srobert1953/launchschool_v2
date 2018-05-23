require 'pg'

class DatabasePersistence
  def initialize(logger)
    @db = if Sinatra::Base.production?
        PG.connect(ENV['DATABASE_URL'])
      else
        PG.connect(dbname: "todos")
      end
    @logger = logger
  end

  def find_list(id)
    sql = <<~SQL
      SELECT lists.id,
             lists.name, 
             count(todos.id) AS todos_count,
             count(nullif(todos.completed, true)) AS todos_remaining_count
        FROM lists
        LEFT JOIN todos ON lists.id = todos.list_id
       WHERE lists.id = $1
       GROUP BY lists.name, lists.id
       ORDER BY lists.name;
    SQL

    result = query(sql, id)
    tuple = result.first
    tuple_to_list_hash(tuple)
  end

  def all_lists
    sql = <<~SQL
      SELECT lists.id,
             lists.name, 
             count(todos.id) AS todos_count,
             count(nullif(todos.completed, true)) AS todos_remaining_count
        FROM lists
        LEFT JOIN todos ON lists.id = todos.list_id
       GROUP BY lists.name, lists.id
       ORDER BY lists.name;
    SQL

    result = query(sql)
    result.map do |tuple|
      tuple_to_list_hash(tuple)
    end
  end

  def create_new_list(list_name)
    sql = "INSERT INTO lists (name) VALUES ($1)"
    query(sql, list_name)
  end

  def delete_list!(id)
    sql_todos = "DELETE FROM todos WHERE list_id = $1"
    sql = "DELETE FROM lists WHERE id = $1"
    query(sql_todos, id)
    query(sql, id)
  end

  def update_list_name(id, new_list_name)
    sql = "UPDATE lists SET name = $1 WHERE id = $2"
    query(sql, new_list_name, id)
    # list = find_list(id)
    # list[:name] = new_list_name
  end

  def new_todo_for_list(list_id, todo_name)
    sql = "INSERT INTO todos (list_id, name) VALUES ($1, $2)"
    query(sql, list_id, todo_name)
  end

  def delete_todo_from_list(list_id, todo_id)
    sql = "DELETE FROM todos WHERE list_id = $1 AND id = $2"
    query(sql, list_id, todo_id)
  end

  def update_todo_status(list_id, todo_id, new_status)
    sql = "UPDATE todos SET completed = $1 WHERE list_id = $2 and id = $3"
    query(sql, new_status, list_id, todo_id)
  end

  def mark_all_todos_as_completed(list_id)
    sql = "UPDATE todos SET completed = true WHERE list_id = $1"
    query(sql, list_id)
  end

  def disconnect
    @db.close
  end

  def find_todos_for_list(id)
    sql = "SELECT id, name, completed FROM todos WHERE list_id = $1;"
    result = query(sql, id)
    result.map do |tuple|
      { id: tuple["id"].to_i, 
        name: tuple["name"], 
        completed: tuple["completed"] == 't' }
    end
  end

  private

  def query(statement, *params)
    @logger.info "#{statement}; #{params}"
    @db.exec_params(statement, params)
  end

  def tuple_to_list_hash(tuple)
    { id: tuple["id"].to_i, 
      name: tuple["name"], 
      todos_count: tuple["todos_count"].to_i,
      todos_remaining_count: tuple["todos_remaining_count"].to_i }
  end
end
