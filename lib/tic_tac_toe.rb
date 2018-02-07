class TicTacToe
  def initialize
    @board = Array.new(9).fill(" ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]
  ]

  def display_board
    puts "\n"
    puts "       #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "      -----------"
    puts "       #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "      -----------"
    puts "       #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "\n"
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count {|e| e != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      combo.all? { |e| @board[e] == "X" } || combo.all? { |e| @board[e] == "O" }
    end
  end

  def full?
    @board.none? { |e| e == " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      first = won?[0]
      @board[first]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  ####
end
