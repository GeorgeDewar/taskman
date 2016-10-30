module Taskman
  module Task
    DEFAULT_TASK_OPTIONS = {
        autorun: false,
        repeat: :run_once
    }

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      # Configure this task. The following options are available:
      #
      #   autorun  - this task will always start when taskman is run. The task will be run with no arguments.
      #              Default: *false*
      #   repeat   - one of :run_once, :start_interval, :between_interval.
      #              Default: :run_once
      #   interval - the interval used for the :start_interval or :between_interval repeat mode, in seconds
      #
      def task_options(opts={})
        @options = opts
      end

      def get_task_options
        DEFAULT_TASK_OPTIONS.merge(@options)
      end
    end
  end
end
