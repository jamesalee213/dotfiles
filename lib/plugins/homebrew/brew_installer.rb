class BrewInstaller

    def install(formula)
        system "brew install #{formula}"
    end

    def uninstall(formula)
    end

    def cask_install(formula)
    end

    def cask_uninstall(formula)
    end

    def bundle(directory)
        brewfile = File.expand_path('Brewfile', directory)
        system("brew bundle --file=#{brewfile}")
    end

end
