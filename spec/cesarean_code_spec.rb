require './cesarean_code'

describe "#cesarean_code" do
  it "ceaserean code for index = 0" do
    expect(cesarean_code("What the f*ck", 0)).to eql("What the f*ck")
  end

  it "ceaserean code for default index" do
    expect(cesarean_code("What a string!")).to eql("Xibu b tusjoh!")
  end
end