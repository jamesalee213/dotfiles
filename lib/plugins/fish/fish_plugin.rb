Dir["#{__dir__}/commands/*.rb"].each {|file| require file }

class Fish

    def initialize
        @commands = [InstallFish.new,
                     SaveFishInEtc.new,
                     ChangeShell.new]
    end

    def plug
        @commands.each { |command|
            if command.should_do
                command.do
            end
        }
    end

    def unplug
        @commands.reverse.each { |command|
            if command.can_undo
                command.undo
            end
        }
    end
end

