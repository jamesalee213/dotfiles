#!/usr/bin/env ruby

require_relative "plugins/homebrew/homebrew_plugin"
require_relative "plugins/fish/fish_plugin"
require_relative "plugins/emacs/emacs_plugin"

puts 'hello world'

$plugins = [
    Homebrew.new,
    Fish.new,
    Emacs.new
]

puts "no plugins installing right now..."

#plugin = Fish.new
#plugin = Emacs.new
#plugin.plug
#plugin.unplug
