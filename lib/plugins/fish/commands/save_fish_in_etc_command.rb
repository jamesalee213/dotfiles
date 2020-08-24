require_relative "fish_util"

class SaveFishInEtc

    include FishUtil

    ETC_SHELLS = "/etc/shells"
    ETC_SHELLS_CONTENT = "cat #{ETC_SHELLS}"
    COMMAND = "echo #{FISH_SHELL} >> #{ETC_SHELLS}"
    UNDO_COMMAND = "sed -i -e '/#{FISH_SHELL}/d' #{ETC_SHELLS}"

    def should_do
        not `#{ETC_SHELLS_CONTENT}`.include? FISH_SHELL
    end

    def do
        system(COMMAND)
    end

    def can_undo
        `#{ETC_SHELLS_CONTENT}`.include? FISH_SHELL
    end

    def undo
        system(UNDO_COMMAND)
    end

end
