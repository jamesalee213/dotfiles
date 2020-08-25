require "plugins/fish/commands/install_fish_command"
require "plugins/plugin_command_spec"

describe InstallFish do
    it_behaves_like "a plugin command"

    describe "#should_do" do
        context "GIVEN fish not installed" do
            before do
                allow(subject).to receive(:`).and_return("something")
            end

            it "SHOULD return true" do
                output = subject.should_do

                expect(output).to eq(true)
            end
        end

        context "GIVEN fish installed" do
            before do
                allow(subject).to receive(:`).and_return("#{InstallFish::FISH_SHELL}")
            end

            it "SHOULD return false" do
                output = subject.should_do

                expect(output).to eq(false)
            end
        end
    end

    describe "#do" do
        before do
            allow(subject).to receive(:system)
        end

        it "SHOULD install fish" do
            subject.do

            expect(subject).to have_received(:system) do |args|
                expect(args).to eq(InstallFish::COMMAND)
            end
        end
    end

    describe "#can_undo" do
        context "GIVEN fish not installed" do
            before do
                allow(subject).to receive(:`).and_return("something")
            end

            it "SHOULD return false" do
                output = subject.can_undo

                expect(output).to eq(false)
            end
        end

        context "GIVEN fish installed" do
            before do
                allow(subject).to receive(:`).and_return("#{InstallFish::FISH_SHELL}")
            end

            it "SHOULD return true" do
                output = subject.can_undo

                expect(output).to eq(true)
            end
        end
    end

    describe "#undo" do
        before do
            allow(subject).to receive(:system)
        end

        it "SHOULD return false" do
            subject.undo

            expect(subject).to have_received(:system).with(InstallFish::UNDO_COMMAND)
        end
    end
end
