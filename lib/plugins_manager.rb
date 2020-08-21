#!/usr/bin/env ruby

require_relative "plugins/homebrew/homebrew_plugin"
require_relative "plugins/fish/fish_plugin"

puts 'hello world'

$plugins = [
    Homebrew.new,
    Fish.new
]

plugin = Fish.new
plugin.plug
