require_relative "fish_util"

class ChangeShell

    include FishUtil

    DEFAULT_SHELL = "echo $SHELL"
    COMMAND = "chsh -s #{FISH_SHELL}"
    UNDO_COMMAND = "undo chsh command"

    def should_do
        `#{DEFAULT_SHELL}`.strip != FISH_SHELL
    end

    def do
        system(COMMAND)
    end

    def can_undo
        `#{DEFAULT_SHELL}`.strip == FISH_SHELL
    end

    def undo
        system(UNDO_COMMAND)
    end

end
