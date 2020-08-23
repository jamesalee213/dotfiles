require "plugins/fish/fish_plugin"

describe Fish do 

    describe ".test" do
        context "given an empty string" do
            it "returns zero" do
                expect(Fish.test("")).to eq(0) 
            end
        end
    end

    describe "#plug" do
        context "given fish is not installed" do
            it "should install fish" do
            end
        end
    end
end
