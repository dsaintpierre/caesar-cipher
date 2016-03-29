require_relative '../lib/caesarcipher'
require_relative '../cipher'

describe Caesar do
  it "should encode messages" do
    expect(Caesar.new(1).encode("cb")).to eq "dc"
  end

  it "should decode messages" do
    expect(Caesar.new(1).decode("dc")).to eq "cb"
  end

  it "should encode numbers" do
    expect(Caesar.new(30).encode("12")).to eq "vw"
  end

  it "should only decode alphanumeric characters" do
    expect(Caesar.new(1).encode("don't}{_change symbols")).to eq "epo'u}{_dibohf tzncpmt"
  end

  it "should be case agnostic" do
    expect(Caesar.new(5).encode("Foo BAr BaZ")).to eq "Ktt GFw Gf4"
  end

  it "should not downcase on decode" do
    expect(Caesar.new(5).decode("Ktt GFw Gf4")).to eq "Foo BAr BaZ"
  end

  it "should accept numbers greater than 62" do
    expect(Caesar.new(100).encode("foo bar baz")).to eq "R00 NM3 NMb"
  end
end
