require 'rb-inotify'
require_relative 'queue'

class LogWatcher

  def initialize(path)
    @file = File.new path, 'r+'
    @file.seek 0, IO::SEEK_END

    @notifier = INotify::Notifier.new
    @queue = Queue.new 2

    @notifier.watch(path, :modify) do
      @queue.add @file.readlines
    end
  end

  def run
    @notifier.run
  end
end
