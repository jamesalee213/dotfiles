class Fish

    def run
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
        fish_in_etc = `cat /etc/shells`.include? "fish"

        if not fish_in_etc
            system("echo /usr/local/bin/fish >> /etc/shells")
            puts "fish saved to /etc/shells"
        end
    end

    def change_shell
        
        default_shell = `echo $SHELL`

        if !default_shell.eql?("fish")
            system("chsh -s /usr/local/bin/fish")
        end
    end

end
