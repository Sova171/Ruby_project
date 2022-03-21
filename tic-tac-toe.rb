WIN_COMBO = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

class Board
  def initialize
    @board = Array.new(9){ |n| n + 1 }
  end

  def printed
    puts "
    #{@board[0]} | #{@board[1]} | #{@board[2]}
    --+---+--
    #{@board[3]} | #{@board[4]} | #{@board[5]}
    --+---+--
    #{@board[6]} | #{@board[7]} | #{@board[8]}
         "
  end

  def update(symbol,nomer)
    @board[nomer-1] = symbol
  end
end

class Game
  def initialize
    @game = Board.new
    @moves = 1
    @choose_of_players = []
    @end_game = true
    start_game
  end

  def start_game
    puts "Hello on the game Tic-Tac-Toe"
    puts "Please enter name of player 1:"
    @player_1 = Player.new(gets.chomp,"X")
    puts "Please enter name of player 2:"
    @player_2 = Player.new(gets.chomp,"0")
    @game.printed
    game
  end

  def game
    while @end_game
    @current_player = @moves%2 == 0 ? @player_2 : @player_1
    puts "Please player #{@current_player.name}(#{@current_player.symbols}) choose your position:"
    player_choose = gets.chomp.to_i
    right_player_choose = right_moves(player_choose)
    @game.update(@current_player.symbols, right_player_choose)
    @current_player.player_moves.push(right_player_choose)
    @choose_of_players.push(right_player_choose)
    @game.printed
    @moves+=1
    its_win
    end
    wanna_new_game
  end

  def right_moves(choose)
    if @choose_of_players.include?(choose)
      puts "Enter another position"
      right_moves(gets.chomp.to_i)
    else
      choose
    end
  end

  def its_win
    WIN_COMBO.each do |combo|
      if combo.all? { |element| @current_player.player_moves.include?(element) }
        puts "#{@current_player.name} you win!"
        @end_game = false
      elsif @moves >= 10
        puts "Novebody win :("
        @end_game = false
      else
        next
      end
    end
  end

  def wanna_new_game
    puts "Want to start a new game? Y/N"
    answer = gets.chomp
    answer = gets.chomp until answer.downcase == 'y' || answer.downcase == 'n'
    if answer.downcase == 'y'
      system 'clear'
      Game.new
    else
      puts "\nGood Bye!"
    end
  end
end

class Player
  attr_reader :name, :symbols, :player_moves
  def initialize(name, symbols)
    @name = name
    @symbols = symbols
    @player_moves = []
  end
end

Game.new