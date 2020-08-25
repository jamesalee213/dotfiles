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
                allow(command).to receive(:`).with(ChangeShell::CURRENT_SHELL).and_return("something")
            end

            it "SHOULD return true" do
                output = command.should_do

                expect(output).to eq(true)
            end
        end

        context "GIVEN fish is default shell" do
            before do
                allow(command).to receive(:`).with(ChangeShell::CURRENT_SHELL).and_return("#{ChangeShell::FISH_SHELL}")
            end

            it "SHOULD return false" do
                output = command.should_do

                expect(output).to eq(false)
            end
        end
    end

    describe "#do" do

        let(:current_shell) { "myshell" }

        before do
            allow(command).to receive(:system)
            allow(command).to receive(:`).with(ChangeShell::CURRENT_SHELL).and_return(current_shell)
            allow(File).to receive(:write)
        end

        it "SHOULD write current shell to file" do
            command.do

            expect(File).to have_received(:write).with(any_args, current_shell + "\n")
        end

        it "SHOULD call system to change shell" do
            command.do

            expect(command).to have_received(:system).with(ChangeShell::COMMAND)
        end

    end

    describe "#can_undo" do
        it "SHOULD return true" do
            output = command.can_undo

            expect(output).to eq(true)
        end
    end

    describe "#undo" do

        let(:default_shell) { "my_shell" }

        before do
            allow(command).to receive(:system)
            allow(File).to receive(:read).and_return(default_shell)
        end

        context "GIVEN /etc/shells does not contain default shell" do
            before do
                allow(command).to receive(:get_etc_shells_content).and_return("some content")
            end

            it "SHOULD call system to change shell to bash" do
                command.undo

                expect(command).to have_received(:system).with(ChangeShell::CHANGE_SHELL + ChangeShell::BASH)
            end
        end

        context "GIVEN /etc/shells contains default shell" do
            before do
                allow(command).to receive(:get_etc_shells_content).and_return("some content"\
                                                                             "#{default_shell}")
            end

            it "SHOULD call system to change shell to default shell" do
                command.undo

                expect(command).to have_received(:system).with(ChangeShell::CHANGE_SHELL + default_shell)
            end
        end

    end
end

