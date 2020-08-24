require "plugins/fish/commands/save_fish_in_etc_command"
require "plugins/plugin_command_spec"

describe SaveFishInEtc do
    it_behaves_like "a plugin command"

    let(:command) { SaveFishInEtc.new }

    describe "#should_do" do
        before do
            allow(command).to receive(:`).and_call_original
        end

        context "GIVEN fish not in /etc/shells" do
            before do
                allow(command).to receive(:`)
                    .with(SaveFishInEtc::ETC_SHELLS_CONTENT)
                    .and_return("Some output"\
                                "/bin/bash"\
                                "/bin/zsh")
            end

            it "SHOULD return true" do
                output = command.should_do

                expect(output).to eq(true)
            end
        end

        context "GIVEN fish in /etc/shells" do
            before do 
                allow(command).to receive(:`)
                    .with(SaveFishInEtc::ETC_SHELLS_CONTENT)
                    .and_return("Some output"\
                                "#{FishUtil::FISH_SHELL}"\
                                "/bin/bash"\
                                "/bin/zsh")
            end

            it "SHOULD return false" do
                output = command.should_do

                expect(output).to eq(false)
            end
        end
    end

    describe "#do" do
        before do
            allow(command).to receive(:system)
        end

        it "SHOULD call system to save fish in /etc/shells" do
            command.do

            expect(command).to have_received(:system).with(SaveFishInEtc::COMMAND)
        end
    end

    describe "#can_undo" do
        before do
            allow(command).to receive(:`).and_call_original
        end

        context "GIVEN fish not in /etc/shells" do
            before do
                allow(command).to receive(:`)
                    .with(SaveFishInEtc::ETC_SHELLS_CONTENT)
                    .and_return("Some output"\
                                "/bin/bash"\
                                "/bin/zsh")
            end

            it "SHOULD return false" do
                output = command.can_undo

                expect(output).to eq(false)
            end
        end

        context "GIVEN fish in /etc/shells" do
            before do 
                allow(command).to receive(:`)
                    .with(SaveFishInEtc::ETC_SHELLS_CONTENT)
                    .and_return("Some output"\
                                "#{FishUtil::FISH_SHELL}"\
                                "/bin/bash"\
                                "/bin/zsh")
            end

            it "SHOULD return true" do
                output = command.can_undo

                expect(output).to eq(true)
            end
        end
    end

    describe "#undo" do
        
        before do
            allow(command).to receive(:system)
        end

        it "SHOULD call system to remove fish in /etc/shells" do
            command.undo

            expect(command).to have_received(:system).with(SaveFishInEtc::UNDO_COMMAND)
        end
    end

end
