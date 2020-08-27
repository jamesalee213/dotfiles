class CreateSymlink

    def initialize(original, link)
        @original = original
        @link = link
    end

    def should_do
        true
    end

    def do
        undo
        system "ln -s #{original} >> #{link}"
    end

    def can_undo
        true
    end

    def undo
        system "rm -f #{link}"
    end
end
