#!/usr/bin/ruby

require 'logger'
# default ERROR
# -v  WARNING
# -vv INFO
# -vvv DEBUG
def get_log_level(switches)
  # levels=["ERROR", "WARN", "INFO", "DEBUG"];
  levels=[Logger::ERROR, Logger::WARN, Logger::INFO, Logger::DEBUG]
  vs = switches.count "v"
  vs < 4 ? levels[vs] : levels[0]

end
