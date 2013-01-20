require "./array"

describe "#my_uniq" do
  it "should not modify original array" do
    original = [1, 2, 3, 3]
    duped_original = original.dup
    duped_original.my_uniq
    duped_original.should == original
  end

  it "should remove duplicates" do
    [1, 2, 3, 3].my_uniq.should == [1, 2, 3]
  end
end

describe "#two_sum" do
  it "should return false if array is empty" do
    [].two_sum.should == false
  end

  it "should return false if only one zero" do
    [0].two_sum.should == false
  end

  it "should return false if there are no sum pairs" do
    [1,2,3].two_sum.should == false
  end

  it "should return true if there are pairs" do
    [1,2,3,-1].two_sum.should == true
  end
  
  #maybe add a test for two zeros
  #maybe add a test for something like this: [1, 2, -1, 3, 1] where three numbers
  #create two pairs
end

describe "TowersOfHanoi" do
  subject(:towers) { TowersOfHanoi.new}
  it "should initalize with three discs on first tower" do
    towers.stacks[0].count.should == 3
  end

  it "should have three towers" do
    towers.stacks.count.should == 3
  end

  it "should be able to move a disc from one tower" do
    towers.move(0,1)
    towers.stacks[0].count.should == 2
  end

  it "should be able to move a disc to a tower" do
    towers.move(0,1)
    towers.stacks[1].count.should == 1
  end

  describe "#is_valid_move?" do
    it "should return false if attempting to move from empty stack" do
      towers.is_valid_move?(2,0).should == false
    end

    it "should return true if moving onto an empty stack" do
      towers.move(0,1)
      towers.is_valid_move?(0,2).should == true
    end

    it "should return false if the source disc is larger than target disc" do
      towers.move(0,1)
      towers.is_valid_move?(0,1).should == false
    end

    it "should return true if the source disc is smaller than target disc" do
      towers.move(0,1)
      towers.is_valid_move?(1,0).should == true
    end
  end

  describe "#game_won?" do
    it "should return false if game isn't won" do
      towers.game_won?.should == false
    end

    it "should return true if game is won" do
      #instead of making all of these moves, you could just 
      #reassign the towers to be in a winning position here
      towers.move(0,1)
      towers.move(0,2)
      towers.move(1,2)
      towers.move(0,1)
      towers.move(2,0)
      towers.move(2,1)
      towers.move(0,1)
      towers.game_won?.should == true
    end
  end
end


describe "#my_transpose" do

  subject(:grid) { [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ] }

  it "should not modify the original grid" do
    dupped_grid = grid.dup
    dupped_grid.my_transpose
    dupped_grid.should == grid
  end

  it "should transpose the grid" do
    grid.my_transpose[0][1].should == grid[1][0]
  end

  it "should transpose the grid" do
    grid.my_transpose.should == [[0,1,2],[3,4,5],[6,7,8]]
  end
end

describe "#stock_picker" do

  subject(:stocks) { [7, 0, 1, 6, 0, 3, 2] }

  it "should only choose a date if the buy date is earlier than the sell date" do
    stocks.stock_picker.should == [1, 3]
  end

end









