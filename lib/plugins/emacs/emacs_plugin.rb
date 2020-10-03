require_relative "../homebrew/brew_installer"
require_relative "../../utils/commands/create_symlink_command"
require_relative "../../utils/commands/add_path_command"

class Emacs
    def initialize(brew_installer = BrewInstaller.new)
        @brew_installer = brew_installer
    end

    def plug
        puts "Installing dependencies..."
        @brew_installer.bundle(__dir__)

        # put a condition
        system "ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app"

        puts "Install Doom emacs..."
        # put a condition
        system "git clone https://github.com/hlissner/doom-emacs ~/.emacs.d"
        system "~/.emacs.d/bin/doom install"

        #maybe need add ~/.emacs.d/bin to PATH

        #move the config files for doom

        # Add check for doom?
        #CreateSymlink.new("#{__dir__}/config.el", "~/.doom.d/config.el")
        #CreateSymlink.new("#{__dir__}/init.el", "~/.doom.d/init.el")
        #CreateSymlink.new("#{__dir__}/packages.el", "~/.doom.d/packages.el")

        # Install kotlin-language-server
        # https://github.com/fwcd/kotlin-language-server/releases/download/0.7.0/server.zip
        # use unzip to unzip the above file

        # Add a check for emacs?
        # move and rename to appropriate place: ~/.emacs.d/lsp-servers/kotlin
        # add the executable to PATH
        # AddPath.new("$HOME/.emacs.d/lsp-servers/kotlin/bin").do
    end

    def unplug
        # Remove doom emacs
        # rm -r ~/.emacs.d ~/.doom.d

        # Remove dependencies
        # brew_installer.unbundle(__dir__)

    end
end
