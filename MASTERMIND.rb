class Game
  def initialize
    @moves = 0
    @win = false
    rulles
    rand_number
    start_game
  end

  def rulles
    puts "Hello. It's game Mastermind. Your task in this game is to guess a four-digit number"
    puts "The numbers do not repeat"
    puts "You have only 12 attempts"
    puts "For each guessed number you get 1 cow"
    puts "For each guessed PLACE of the number you get 1 bull"
    puts "Remember you have to guess the number"
    puts "Good luck and Lets start game"
  end

  def rand_number
    array = Array.new(10){ |n| n }
    @result = array.sample(4)
  end

  def start_game
    while @moves<12 && !@win
      puts "Enter your number"
      choise = gets.chomp
      @moves+=1
      cow(choise)
      bull(choise)
      puts "You have #{12-@moves} attempts left"
    end
    win
    wanna_new_game
  end

  def cow(number)
    int_arr = number.split(//).map(&:to_i)
    cows = @result - int_arr
    puts "You got #{4-cows.size} cows"
  end

  def bull(number)
    int_arr = number.split(//).map(&:to_i)
    i = 0
    bulls = 0
    for i in 0...@result.size
      if int_arr[i] == @result[i]
        bulls+=1
      end
    end
    puts "You got #{bulls} bulls"
    if bulls == 4
      @win = true
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

  def win
    puts
    if @win == true
      puts "Congratulations on winning!!!"
    else
      puts "Sorry you lose :( The right answer was #{@result}"
    end
  end
end

Game.new

