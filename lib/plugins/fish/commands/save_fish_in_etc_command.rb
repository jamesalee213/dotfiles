require_relative "fish_util"

class SaveFishInEtc

    ETC_SHELLS = "/etc/shells"
    ETC_SHELLS_CONTENT = "cat #{ETC_SHELLS}"
    COMMAND = "echo #{FishUtil::FISH_SHELL} >> #{ETC_SHELLS}"
    UNDO_COMMAND = "sed '/#{FishUtil::FISH_SHELL}/d' #{ETC_SHELLS}"

    def should_do
        not `#{ETC_SHELLS_CONTENT}`.include? FishUtil::FISH_SHELL
    end

    def do
        system(COMMAND)
    end

    def can_undo
        `#{ETC_SHELLS_CONTENT}`.include? FishUtil::FISH_SHELL
    end

    def undo
        system(UNDO_COMMAND)
    end

end
