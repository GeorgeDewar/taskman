module Taskman
  DEFAULT_OPTIONS = {
      heartbeat_stop_timeout: 10,
      heartbeat_free_timeout: 15,
      redis_url: "redis://127.0.0.1:6379"
  }
  @options = DEFAULT_OPTIONS

  # A task will terminate (in preparation for another worker claiming it) if it fails to send heartbeats for this
  # duration
  def self.heartbeat_stop_timeout=(value)
    @options[:heartbeat_stop_timeout] = value
  end

  # A task will become available for other workers if no heartbeat is received for this duration
  def self.heartbeat_free_timeout=(value)
    @options[:heartbeat_free_timeout] = value
  end

  def self.redis_url=(value)
    @options[:redis_url] = value
  end

  def self.setup
    yield self
  end

  def self.options
    DEFAULT_OPTIONS.merge(@options)
  end
end

require 'taskman/task'
