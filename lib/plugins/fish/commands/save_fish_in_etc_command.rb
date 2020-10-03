require_relative "fish_util"

class SaveFishInEtc

    include FishUtil

    # maybe we can just use tee for saving
    # echo /usr/local/bin/fish | sudo tee -a /etc/shells
    COMMAND = "sudo sed -i -e '$ a\\\n #{FISH_SHELL.gsub('/', '\/')}\n' #{ETC_SHELLS}"
    UNDO_COMMAND = "sudo sed -i -e '/#{FISH_SHELL.gsub('/', '\/')}/d' #{ETC_SHELLS}"

    def should_do
        not get_etc_shells_content.include? FISH_SHELL
    end

    def do
        system(COMMAND)
    end

    def can_undo
       get_etc_shells_content.include? FISH_SHELL
    end

    def undo
        system(UNDO_COMMAND)
    end

end
