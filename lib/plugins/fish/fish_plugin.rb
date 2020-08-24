Dir["#{__dir__}/commands/*"].each {|file| require file }
require_relative "../homebrew/brew_bundler"

class Fish

    include FishUtil
    include BrewBundler

    def initialize
        @commands = [SaveFishInEtc.new]
    end

    def plug
        if not is_fish_installed
            brew_bundle(__dir__)
        end
        
        if not is_fish_in_etc
            save_fish_to_etc
        end

=begin
        if not is_fish_default_shell
            #change_shell
        end
=end
    end

    def unplug
    end
end

