require_relative "fish_util"

class SaveFishInEtc

    include FishUtil

    ETC_SHELLS = "/etc/shells"
    ETC_SHELLS_CONTENT = "cat #{ETC_SHELLS}"
    COMMAND = "sudo sed -i -e '$ a\\\n #{FISH_SHELL.gsub('/', '\/')}\n' #{ETC_SHELLS}"
    UNDO_COMMAND = "sudo sed -i -e '/#{FISH_SHELL.gsub('/', '\/')}/d' #{ETC_SHELLS}"

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
