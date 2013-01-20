require "./string"

describe "#caesar_cipher" do
  it "should take a string and shift key" do
    caesar_cipher("hello", 3)
  end

  it "should adjust the string by proper shift value" do
    caesar_cipher("hello", 3).should == "khoor"
  end

  it "shouldn't adjust needlessly" do
    caesar_cipher("hello", 0).should == "hello"
  end
  
  #add a test for an empty string
  #add a test for things that should loop back to the beginning of the alphabet. ex: ("hello", 30)
end
