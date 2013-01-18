class Array
  def my_uniq
    dup.my_uniq!
  end

  def my_uniq!
    count.times do |i1|
      count.times do |i2|
        next if i2 <= i1
        if self[i1] == self[i2]
          self.delete_at(i2)
        end
      end
    end

    self
  end

  def two_sum
    count.times do |i1|
      count.times do |i2|
        next if i2 <= i1
        return true if self[i1] + self[i2] == 0
      end
    end
    false
  end

  def my_transpose
    transposed = Array.new(self.count) { [] }

    count.times do |i1|
      self[i1].count.times do |i2|
        transposed[i2][i1] = self[i1][i2]
      end
    end

    transposed
  end

  def stock_picker
    #return an array of the days(index) form [buy, sell]
    buy_sell = [nil, nil]
    highest_val = 0
    count.times do |i1|
      count.times do |i2|
        next if i2 <= i1
        if self[i2] - self[i1] > highest_val
          buy_sell = [i1, i2]
          highest_val = self[i2] - self[i1]
        end
      end
    end
    buy_sell
  end
end

class TowersOfHanoi
  attr_reader :stacks

  def initialize
    @stacks = Array.new(3) { [] }
    @stacks[0] =[3, 2, 1]
  end

  def play
    puts "Welcome to Hanoi.. make your move, chum."

    until game_won?
      print_board
      from, to = get_move
      move(from, to)
    end

    puts "You da besss boo."
  end

  def print_board
    puts
    puts "Stack 1: #{@stacks[0].join(", ")}"
    puts "Stack 2: #{@stacks[1].join(", ")}"
    puts "Stack 3: #{@stacks[2].join(", ")}"
    puts
  end

  def get_move
    while true
      puts "Whats your move? from, to. Ex: 1, 3"
      player_move = gets.chomp.split(", ").map(&:to_i)
      player_move = player_move.map { |i| i-1 }
      return player_move if is_valid_move?(player_move[0], player_move[1])
    end
  end

  def move(from, to)
    @stacks[to] << @stacks[from].pop
  end

  def is_valid_move?(from, to)
    return false if @stacks[from].empty?
    return true if @stacks[to].empty?
    return false if @stacks[from].last > @stacks[to].last
    true
  end

  def game_won?
    return true if @stacks[1] == [3, 2, 1]
    return true if @stacks[2] == [3, 2, 1]
    false 
  end
end