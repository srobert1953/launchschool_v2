class MyClass
  def step(from, to, step)
    current_step = from

    while current_step <= to
      yield(current_step)
      current_step += step
    end
  end
end

