#!/usr/bin/ruby

require 'test/unit'
require 'logger'


require_relative './command-parser-tests'
require_relative './parse-entry-test'

$LOG = Logger.new(STDOUT)
$LOG.level = Logger::INFO
