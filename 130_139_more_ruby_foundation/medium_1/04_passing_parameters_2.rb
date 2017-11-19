def my_method(birds)
  yield(birds) if block_given?
end

birds = %w(raven finch hawk eagle)

my_method(birds) do |_, _, *raptors|
  p raptors
end
