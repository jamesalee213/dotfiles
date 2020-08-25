require_relative "fish_util"

class ChangeShell

    include FishUtil

    DEFAULT_SHELL_FILE = "#{__dir__}/default_shell"
    CURRENT_SHELL = "echo $SHELL"
    CHANGE_SHELL = "chsh -s "
    COMMAND = CHANGE_SHELL + FISH_SHELL
    BASH = "/bin/bash"

    def should_do
        get_current_shell != FISH_SHELL
    end

    def do
        File.write(DEFAULT_SHELL_FILE, get_current_shell + "\n")
        system(COMMAND)
    end

    def can_undo
        true
    end

    def undo
        begin
            default_shell = File.read(DEFAULT_SHELL_FILE).strip
            if get_etc_shells_content.include? default_shell
                system(CHANGE_SHELL + default_shell)
            else
                system(CHANGE_SHELL + BASH)
            end
        rescue
            system(CHANGE_SHELL + BASH)
        end
    end

    private 

    def get_current_shell
        `#{CURRENT_SHELL}`.strip
    end

end
