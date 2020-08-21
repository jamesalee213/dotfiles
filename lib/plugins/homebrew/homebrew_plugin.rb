
class Homebrew

    BREWFILE = "~/.dotfiles/homebrew/Brewfile".freeze

    def initialize
        @installer = HomebrewInstaller.new
    end

    def plug
        if @installer.should_install
            puts "Installing Homebrew"
            @installer.install
        else
            puts "Homebrew is already installed"
        end

        system("brew bundle --file=#{BREWFILE}")
    end
end    

class HomebrewInstaller
    def should_install
        return `which brew`.to_s.empty?
    end

    def install
        system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"')
        puts "Homebrew has successfully been installed"
    end

    def uninstall
        system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"')
    end
end
