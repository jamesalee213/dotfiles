Dir["#{__dir__}/commands/*"].each {|file| require file }
require_relative "../homebrew/brew_bundler"

class Fish

    include FishUtil
    include BrewBundler

    def initialize
        @commands = [SaveFishInEtc.new,
                     ChangeShell.new]
    end

    def plug
        if not is_fish_installed
            brew_bundle(__dir__)
        end
        
        # save fish to etc

        # change shell
    end

    def unplug
    end
end

