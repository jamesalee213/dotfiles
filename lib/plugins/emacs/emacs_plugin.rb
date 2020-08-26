require_relative "../homebrew/brew_installer"

class Emacs
    def initialize(brew_installer = BrewInstaller.new)
        @brew_installer = brew_installer
    end

    def plug
        puts "Installing dependencies..."
        @brew_installer.bundle(__dir__)
        system "ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app"

        puts "Install Doom emacs..."
        system "git clone https://github.com/hlissner/doom-emacs ~/.emacs.d"
        system "~/.emacs.d/bin/doom install"

        #maybe need add ~/.emacs.d/bin to PATH
    end

    def unplug
        # Remove doom emacs
        # rm -r ~/.emacs.d ~/.doom.d

        # Remove dependencies
        # brew_installer.unbundle(__dir__)

    end
end
