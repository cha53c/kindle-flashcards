require 'logger'

class DoStuff

  attr_accessor :on

  def initialize
    @logger = Logger.new(STDOUT)
    # @logger.level = Logger::DEBUG

    @logger.info("initializing")
    @name = "no name"
    @logger.debug("name: #{@name}");
  end
end
