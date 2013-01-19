require './tictactoe'

describe "TicTacToe" do
  subject(:game) { TicTacToe.new}

  it { should respond_to(:mark) }
  it { should respond_to(:board) }
  it { should respond_to(:player1) }
  it { should respond_to(:player2) }

  describe "#board" do
    it "should be a 3 x 3" do
      game.board.count.should == 3
      game.board[0].count.should == 3
    end
  end

  describe "#valid_move?" do
    it "returns false if space is occupied" do
      game.mark(0,0, :x)
      game.valid_move?(0,0)
    end
  end

  describe "#mark" do
    it "should place a mark" do
      game.mark(0,0, :x)

      game.board[0][0].should == :x
    end
  end

  describe "#win?" do
    it "returns true if the game is won" do
      game.mark(0,0, :x)
      game.mark(0,1, :x)
      game.mark(0,2, :x)

      game.win?.should == true
    end
  end

  #describe

end