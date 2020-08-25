require "plugins/fish/fish_plugin"

describe Fish do 

    subject(:plugin) { Fish.new }

    describe "#plug" do
        
        before do
            allow(plugin).to receive(:`).and_call_original
            allow(plugin).to receive(:system)
            allow(plugin).to receive(:brew_bundle)
        end

        context "GIVEN fish is not installed" do
            before do
                allow(plugin).to receive(:`).with("which fish").and_return("")
            end

            xit "SHOULD install fish" do
                plugin.plug
                expect(plugin).to have_received(:brew_bundle)
            end
        end

        context "GIVEN fish is installed" do
            before do
                allow(plugin).to receive(:`).with("which fish").and_return(Fish::FISH_SHELL)
            end

            xit "SHOULD not install fish" do
                plugin.plug
                expect(plugin).not_to have_received(:brew_bundle)
            end

            context "GIVEN fish is not in /etc/shells" do
                before do
                    allow(plugin).to receive(:`)
                        .with(Fish::SHOW_ETC_SHELL)
                        .and_return("Some output"\
                                    "/bin/bash"\
                                    "/bin/zsh")
                end

                xit "SHOULD save fish to /etc/shells" do
                    plugin.plug
                    expect(plugin).to have_received(:system).with(Fish::SAVE_FISH_TO_ETC)
                end
            end

            context "GIVEN fish is in /etc/shells" do
                before do
                    allow(plugin).to receive(:`)
                        .with(Fish::SHOW_ETC_SHELL)
                        .and_return("Some output"\
                                    "#{Fish::FISH_SHELL}"\
                                    "/bin/bash"\
                                    "/bin/zsh")
                end

                xit "SHOULD not save fish to /etc/shells" do
                    plugin.plug
                    expect(plugin).not_to have_received(:system)
                end
            end
        end

        context "given fish is in /etc/shells" do
            before do
            end

            xit "SHOULD not save fish to /etc/shells" do
            end
        end
    end
end
