class TicTacToe
  DIAGONALS = [
    [@board[0][0], @board[1][1], @board[2][2]],
    [@board[2][0], @board[1][1], @board[0][2]]
  ]
  ROWS = [
    [@board[0][0], @board[0][1], @board[0][2]],
    [@board[1][0], @board[1][1], @board[1][2]],
    [@board[2][0], @board[2][1], @board[2][2]]
  ]
  COLS = [
    [@board[0][0], @board[1][0], @board[2][0]],
    [@board[0][1], @board[1][1], @board[2][1]],
    [@board[0][2], @board[1][2], @board[2][2]]
  ]
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Array.new(3) { Array.new(3)}
  end

  def mark(row, col, symbol)
    @board[row][col] = symbol
  end

  def valid_move?(row, col)
    return false if @board[row][col]
    true
  end

  def win?
    triples = [[:x]*3, [:o]*3]
    triples.each do |trp|
      return true if DIAGONALS.include?(trp)
      return true if ROWS.include?(trp)
      return true if COLS.include?(trp)
    end
  end

end