module FishUtil

    FISH_SHELL = "/usr/local/bin/fish"

    CHANGE_SHELL = "chsh -s #{FISH_SHELL}"

    private 

    def is_fish_installed
        `which fish`.strip == FISH_SHELL
    end

    def is_fish_default_shell
        `echo $SHELL`.strip == FISH_SHELL
    end

    def change_shell
        system(CHANGE_SHELL)
    end
end
