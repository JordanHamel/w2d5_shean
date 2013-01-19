class TicTacToe
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Array.new(3) { Array.new(3)}
  end

  def play
    puts "Welcome to Tic-Tac-Toe!"
    @turn = 1
    until win?
      symbol = @turn.odd? ? :x : :o
      print_board
      puts "#{symbol.to_s.upcase}'s turn."
      row, col = get_move
      mark(row, col, symbol)
      @turn += 1
    end

    puts
    puts "Game Over!"
    puts
    print_board
    puts
  end

  def print_board
    puts
    @board.count.times do |i1|
      print "#{3-i1} "
      @board.count.times do |i2|
        render_marks(i1, i2)
        print " | " unless i2 == @board.count - 1
      end
      puts
      puts "  =========" unless i1 == @board.count - 1
    end
    puts
    puts "  1   2   3"
    puts
  end

  def render_marks(i1, i2)
    case board[i1][i2]
    when :x then print "X"
    when :o then print "O"
    else print " "
    end
  end

  def get_move
    while true
      print "Where you wanna move (row, col)? ex 1, 2: "
      move = gets.chomp
      move = move.scan(/\d/).map(&:to_i)
      row = (3 - move[0]) % 3
      col =  move[1] -= 1
      return row, col if valid_move?(row, col)
      puts "Invalid move, please re-enter.."
    end
  end

  def mark(row, col, symbol)
    @board[row][col] = symbol
  end

  def valid_move?(row, col)
    return false if @board[row][col]
    true
  end

  def win?
    diagonals = [
      [@board[0][0], @board[1][1], @board[2][2]],
      [@board[2][0], @board[1][1], @board[0][2]]
    ]
    rows = [
      [@board[0][0], @board[0][1], @board[0][2]],
      [@board[1][0], @board[1][1], @board[1][2]],
      [@board[2][0], @board[2][1], @board[2][2]]
    ]
    cols = [
      [@board[0][0], @board[1][0], @board[2][0]],
      [@board[0][1], @board[1][1], @board[2][1]],
      [@board[0][2], @board[1][2], @board[2][2]]
    ]

    triples = [[:x]*3, [:o]*3]
    triples.each do |trp|
      return true if diagonals.include?(trp)
      return true if rows.include?(trp)
      return true if cols.include?(trp)
    end
    false
  end
end

while true
  TicTacToe.new.play
  print "Play again? (y/n): "
  play_again = gets.chomp.downcase
  if play_again[0] == 'y'
  else
    puts "Thanks for playing!"
    puts
    return
  end
end