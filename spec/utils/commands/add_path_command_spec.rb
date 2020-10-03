require "utils/commands/add_path_command"
require "plugins/plugin_command_spec"

describe AddPath do

    let(:test_path) { "test path" }
    subject { AddPath.new(test_path) }

    it_behaves_like "a plugin command"

    describe "#do" do
        before do
            allow(subject).to receive(:system)
        end

        it "SHOULD add correct path export to bash_profile" do
            subject.do

            expect(subject).to have_received(:system).with("echo 'export PATH=#{test_path}:$PATH' >> ~/.bash_profile")
        end
    end
end
