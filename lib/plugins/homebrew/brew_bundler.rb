module BrewBundler 
    private 

    def brew_bundle(directory)
        brewfile = brewfile || File.expand_path('Brewfile', directory)
        system("brew bundle --file=#{brewfile}")
    end
end
