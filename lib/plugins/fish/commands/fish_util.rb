module FishUtil

    FISH_SHELL = "/usr/local/bin/fish"

    private 

    def is_fish_installed
        `which fish`.strip == FISH_SHELL
    end

end
