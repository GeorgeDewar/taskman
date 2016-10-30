require 'minitest/autorun'
require 'taskman'

class TaskmanTest < Minitest::Test
  def test_hi
    assert_equal "hi", Taskman.hi
  end
end
