class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '
  attr_accessor :title, :description, :done

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    raise TypeError, "Can only add Todo objects" unless item.class == Todo

    todos.push(item)
  end
  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    todos.fetch(idx).done!
  end

  def mark_undone_at(idx)
    todos.fetch(idx).undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.delete_at(idx)
  end

  def done?
    todos.all? { |item| item.done? }
  end

  def done!
    todos.each { |item| item.done! }
  end

  def each
    todos.each do |item|
      yield(item)
    end
    self
  end

  def select
    result = TodoList.new(title)

    each do |item|
      result.add(item) if yield(item)
    end

    result
  end

  def to_s
    print_str = "--- #{title} ---\n"
    todos.each { |item| print_str += "#{item}\n" }

    print_str
  end

  private

  attr_reader :todos
end




task1 = Todo.new('Go to store')
task2 = Todo.new('Buy Milk')
task3 = Todo.new('Pay groceries')
list = TodoList.new('Shopping list')

list.add(task1)
list.add(task2)
list.add(task3)

task2.done!
list.each { |item| puts item }

puts  ''
result = list.select { |item| item.done? }
puts result



