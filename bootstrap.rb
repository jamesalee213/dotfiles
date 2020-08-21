#!/usr/bin/env ruby

require "./homebrew/homebrew_plugin.rb"
require "./fish/fish_plugin.rb"

puts 'hello world'

#plugin = Homebrew.new

plugin = Fish.new
plugin.run
