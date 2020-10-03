
class Python
    def plug
        # This installs python3
        system "brew install python"

        # Add alias to fish shell
        system "echo 'alias python=/usr/local/bin/python3.8' >> #{__dir__}/../fish/config.fish"
    end

    def unplug
        system "brew uninstall python"
    end
end
