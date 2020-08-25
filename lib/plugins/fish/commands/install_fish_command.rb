require_relative "fish_util"

class InstallFish

    include FishUtil

    COMMAND = "brew install fish"
    UNDO_COMMAND = "brew remove fish"

    def should_do
        `which fish`.strip != FISH_SHELL
    end

    def do
        system(COMMAND)
    end

    def can_undo
        !should_do
    end

    def undo
        system(UNDO_COMMAND)
    end
end
