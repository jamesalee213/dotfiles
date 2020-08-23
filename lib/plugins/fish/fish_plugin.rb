require_relative "../homebrew/brew_bundler"
require_relative "fish_util"

class Fish

    include BrewBundler
    include FishUtil

    def plug
        if not is_fish_installed
            puts "Installing fish..."
            brew_bundle(__dir__)
        end

        save_fish_to_etc

        change_shell
    end

    def self.test(foobar)
        0
    end
end

