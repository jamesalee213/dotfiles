shared_examples "a plugin command" do
    it { is_expected.to respond_to(:should_do) }
    it { is_expected.to respond_to(:do) }
    it { is_expected.to respond_to(:can_undo) }
    it { is_expected.to respond_to(:undo) }
end
