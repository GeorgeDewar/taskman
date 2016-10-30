require 'minitest/autorun'
require 'taskman'

class TaskmanTest < Minitest::Test
  class TestTask
    include Taskman::Task

    task_options autorun: true
  end

  class TestTask2
    include Taskman::Task

    task_options autorun: false
  end

  def test_options
    assert_equal TestTask.get_task_options, {
        autorun: true,
        repeat: :run_once
    }

    assert_equal TestTask2.get_task_options, {
        autorun: false,
        repeat: :run_once
    }
  end
end
