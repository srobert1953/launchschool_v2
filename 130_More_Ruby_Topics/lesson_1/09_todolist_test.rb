require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '09_todo_list'

class TodolistTest < MiniTest::Test
  def setup
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Go to gym')
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list << @todo1
    @list << @todo2
    @list << @todo3
  end

  def test_list_to_array
    assert_equal(@todos, @list.to_a)
  end

  def test_todos_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first_from_list
    assert_equal(@todo1, @list.first)
  end

  def test_last_from_list
    assert_equal(@todo3, @list.last)
  end

  def test_shift_from_list
    removed_object = @list.shift

    assert_equal(@todo1, removed_object)
    assert_equal(2, @list.size)
  end

  def test_pop_from_list
    removed_object = @list.pop

    assert_equal(@todo3, removed_object)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_all_tasks_done
    @todo1.done!
    @todo2.done!
    @todo3.done!

    assert(@list.done?)
  end

  def test_list_not_done
    assert_equal(false, @list.done?)
  end

  def test_only_todo_in_list
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_alias_to_add
    todo = Todo.new('Walk the dog')
    @todos << todo
    @list << todo
    assert_equal(@todos, @list.to_a)
  end

  def test_add_to_list
    todo = Todo.new('Feed the cat')
    @todos << todo
    @list.add todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at_index
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    @list.mark_done_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    @todo1.done!
    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_list_done
    @list.done!

    assert(@list.done?)
  end

  def test_remove_at
    removed_todo = @list.remove_at(0)

    assert_equal(@todo1, removed_todo)
    assert_raises(IndexError) { @list.remove_at(100) }
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    @todo2.done!

    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    @list.done!

    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []

    @list.each { |item| result << item }

    assert_equal(result, @list.to_a)
  end

  def test_each_return_value
    return_value = @list.each { |item| item }

    assert_equal(return_value, @list)
  end

  def test_select
    @todo1.done!
    selected_list = @list.select { |item| item.done? }

    new_list = TodoList.new("Today's Todos")
    new_list << @todo1

    assert_equal(selected_list, new_list)
  end

end
