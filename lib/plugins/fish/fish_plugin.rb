Dir["#{__dir__}/commands/*.rb"].each {|file| require file }
require_relative "../../utils/commands/create_symlink_command"

class Fish

    def initialize
        @commands = [InstallFish.new,
                     SaveFishInEtc.new,
                     ChangeShell.new,
                     CreateSymlink.new("#{__dir__}/config.fish", "~/.config/fish/config.fish")]
    end

    def plug
        @commands.each { |command|
            if command.should_do
                #command.do
            end
        }
    end

    def unplug
        @commands.reverse.each { |command|
            if command.can_undo
                #command.undo
            end
        }
    end
end

