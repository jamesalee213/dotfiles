module FishUtil

    ETC_SHELLS = "/etc/shells"
    FISH_SHELL = "/usr/local/bin/fish"

    SHOW_ETC_SHELL = "cat #{ETC_SHELLS}"
    SAVE_FISH_TO_ETC = "echo #{FISH_SHELL} >> #{ETC_SHELLS}"

    CHANGE_SHELL = "chsh -s #{FISH_SHELL}"

    private 

    def is_fish_installed
        `which fish`.strip == FISH_SHELL
    end

    def is_fish_in_etc
        `#{SHOW_ETC_SHELL}`.include? FISH_SHELL
    end

    def save_fish_to_etc
        system(SAVE_FISH_TO_ETC)
    end


    def is_fish_default_shell
        `echo $SHELL`.strip == FISH_SHELL
    end

    def change_shell
        system(CHANGE_SHELL)
    end
end
