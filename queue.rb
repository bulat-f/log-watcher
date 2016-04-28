class Queue

  attr_accessor :max_lenght

  def initialize(max_length = 10)
    @max_length = max_length
    @logs = []
  end

  def add(logs)
    @logs.concat logs
    if @logs.size > @max_length
      puts @logs
      @logs.clear
    end
  end
end
