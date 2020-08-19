#!/usr/bin/env ruby

require "./homebrew/homebrew.rb"

puts 'hello world'

plugin = Homebrew.new
plugin.run
