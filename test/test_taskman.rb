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

  def test_taskman_options
    Taskman.setup do |config|
      config.heartbeat_stop_timeout = 11
    end
    assert_equal 11, Taskman.options[:heartbeat_stop_timeout]
  end

  def test_task_options
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
