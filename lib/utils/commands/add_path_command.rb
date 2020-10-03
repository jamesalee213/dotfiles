class AddPath

    def initialize(path)
        @path = path
    end

    def should_do
        true
    end

    def do
        # https://superuser.com/questions/1151824/reuse-bash-profile-for-fish-in-mac
        # decide whether you want to update .bash_profile vs config.fish?
        system "echo 'export PATH=#{@path}:$PATH' >> ~/.bash_profile"
        # system "echo 'export JAVA_HOME=\"/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home\"' >> ~/.bash_profile"
    end

    def can_undo
        true
    end

    def undo
        # might have to use sed to remove the line
        # We might want to refactor SaveFishInEtc command
        # system "rm -f #{link}"
    end
end
