#!/usr/bin/ruby

require 'test/unit'
require 'logger'


require_relative './command-parser-tests'
# require_relative './parse-entry-test'
require_relative './text-builder-tests'
require_relative './get-entry-tests'
require_relative './exclude-words-tests'

$LOG = Logger.new(STDOUT)
$LOG.level = Logger::INFO
