class Fish

    ETC_SHELLS = "/etc/shells"
    FISH_SHELL = "/usr/local/bin/fish"

    def plug
        if should_run
            save_fish_to_etc
            change_shell
        else
            puts "fish is NOT installed."
        end
    end

    def should_run
        return !`which fish`.to_s.empty?
    end

    def save_fish_to_etc
        fish_in_etc = `cat #{ETC_SHELLS}`.include? FISH_SHELL

        if not fish_in_etc
            system("echo #{FISH_SHELL} >> #{ETC_SHELLS}")
            puts "#{FISH_SHELL} is saved to #{ETC_SHELLS}"
        end
    end

    def change_shell
        default_shell = `echo $SHELL`

        if not default_shell.strip == FISH_SHELL
            system("chsh -s #{FISH_SHELL}")
        end
    end

end
