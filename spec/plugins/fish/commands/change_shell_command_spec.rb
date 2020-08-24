require "plugins/fish/commands/change_shell_command"
require "plugins/plugin_command_spec"

describe ChangeShell do
    it_behaves_like "a plugin command"

    let(:command) { ChangeShell.new }

    describe "#should_do" do
        before do
            allow(command).to receive(:`).and_call_original
        end

        context "GIVEN fish is not default shell" do
            before do
                allow(command).to receive(:`).with(ChangeShell::DEFAULT_SHELL).and_return("something")
            end

            it "SHOULD return true" do
                output = command.should_do

                expect(output).to eq(true)
            end
        end

        context "GIVEN fish is default shell" do
            before do
                allow(command).to receive(:`).with(ChangeShell::DEFAULT_SHELL).and_return("#{ChangeShell::FISH_SHELL}")
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

        it "SHOULD call system to change shell" do
            command.do

            expect(command).to have_received(:system).with(ChangeShell::COMMAND)
        end
    end

    describe "#can_undo" do
        before do
            allow(command).to receive(:`).and_call_original
        end

        context "GIVEN fish is not default shell" do
            before do
                allow(command).to receive(:`).with(ChangeShell::DEFAULT_SHELL).and_return("something")
            end

            it "SHOULD return false" do
                output = command.can_undo

                expect(output).to eq(false)
            end
        end

        context "GIVEN fish is default shell" do
            before do
                allow(command).to receive(:`).with(ChangeShell::DEFAULT_SHELL).and_return("#{ChangeShell::FISH_SHELL}")
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

        it "SHOULD call system to change shell" do
            command.undo

            expect(command).to have_received(:system).with(ChangeShell::UNDO_COMMAND)
        end
    end
end

