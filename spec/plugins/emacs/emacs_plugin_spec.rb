require "plugins/emacs/emacs_plugin"

describe Emacs do 

    let(:brew_installer) { spy('brew_installer') }
    subject { Emacs.new(brew_installer) }

    describe "#plug" do
        before do
            allow(subject).to receive(:system)
            subject.plug
        end

        it "installs all the dependencies" do
            expect(brew_installer).to have_received(:bundle)
        end

        it "installs doom emacs" do
        end
    end
end
