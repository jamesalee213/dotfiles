module FishUtil

    FISH_SHELL = "/usr/local/bin/fish"

    private 

    ETC_SHELLS = "/etc/shells"
    ETC_SHELLS_CONTENT = "cat #{ETC_SHELLS}"

    def get_etc_shells_content
        `#{ETC_SHELLS_CONTENT}`.strip
    end
end
