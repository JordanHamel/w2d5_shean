require "./hash"

describe "#set_add_el" do
  it "should add elements to the passed hash" do
    set_add_el({}, :x).should == {:x => true}
  end

  it 'should not add duplicate elements to the passed hash' do
    set_add_el({:x => true}, :x).should == {:x => true}
  end
end



describe "#set_remove_el" do
  it "should remove elements from the passed hash" do
    set_remove_el({:x => true}, :x).should == {}
  end
end

describe "#set_list_els" do
  it "should list the elements in the passed set" do
    set_list_els({:x => true, :y => true}).should == [:x, :y]
  end
end

describe "#set_member?" do
  it "should return true if the set contains the passed value" do
    set_member?({:x => true}, :x).should == true
  end
end

describe "#set_union" do
  it "should combine two sets" do
    set_union({:x => true}, {:y => true}).should == {:x => true, :y => true}
  end

  it "should not duplicate values in an intersect" do
    set_union({:x => true, :y => true}, {:y => true, :z => true}).should == {:x => true, :y => true, :z => true}
  end
end

describe "#set_intersection" do
  it "should return the intersection of two sets" do
    set_intersection({:x => true, :y => true}, {:y => true, :z => true}).should == {:y => true}
  end
end

describe "#set_minus" do
  it "should subtract one set from another" do
    set_minus({:x => true, :y => true}, {:y => true}).should == {:x => true}
  end
end