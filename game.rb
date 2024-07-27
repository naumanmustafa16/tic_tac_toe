# frozen_string_literal: true

require_relative 'lib/players'
# class Game
class Game
  @@board = { "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9 }
  attr_accessor :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def turn
    if rand < 0.5
      puts "Player1 having symbol #{player1.symbol} will play first"
      player_with_1st_turn = @player1
    else
      puts "Player2 having symbol of #{player2.symbol} will play first."
      player_with_1st_turn = @player2
    end

    turns = 0

    if player_with_1st_turn == @player1
      while turns < 9

        puts "#{player1.name} will put #{player1.symbol} at position: "
        at = gets.chomp.to_s.to_sym
        @@board[at] = player1.symbol
        display
        break if check_result(player1) == true

        turns += 1
        if turns == 9
          puts 'Match Drawn'
          break
        end
        puts "#{player2.name} will put #{player2.symbol} at position: "
        at = gets.chomp.to_s.to_sym
        @@board[at] = player2.symbol
        display
        break if check_result(player2) == true

        turns += 1
        break if turns > 8
      end
    else

      while turns < 9
        puts "#{player2.name} will put #{player2.symbol} at position: "
        at = gets.chomp.to_s.to_sym
        @@board[at] = player2.symbol
        display

        break if check_result(player2) == true

        turns += 1
        if turns == 9
          puts 'Match Drawn'
          break
        end

        puts "#{player1.name} will put #{player1.symbol} at position: "
        at = gets.chomp.to_s.to_sym
        @@board[at] = player1.symbol
        display
        break if check_result(player1) == true

        turns += 1
      end
    end
  end

  def display
    display = "_#{@@board[:'1']}_|_#{@@board[:'2']}_|_#{@@board[:'3']}_\n_#{@@board[:'4']}_|_#{@@board[:'5']}_|_#{@@board[:'6']}_\n_#{@@board[:'7']}_|_#{@@board[:'8']}_|_#{@@board[:'9']}_"
    puts display
  end

  def check_result(player)
    if @@board[:"1"] == @@board[:"2"] && @@board[:"2"] == @@board[:"3"] ||
       @@board[:"1"] == @@board[:"5"] && @@board[:"5"] == @@board[:"9"] ||
       @@board[:"1"] == @@board[:"4"] && @@board[:"4"] == @@board[:"7"] ||
       @@board[:"2"] == @@board[:"5"] && @@board[:"5"] == @@board[:"8"] ||
       @@board[:"3"] == @@board[:"6"] && @@board[:"6"] == @@board[:"9"] ||
       @@board[:"4"] == @@board[:"5"] && @@board[:"5"] == @@board[:"6"] ||
       @@board[:"7"] == @@board[:"8"] && @@board[:"8"] == @@board[:"9"]
      puts "#{player.name} wins."
      true
    end
  end
end
player1 = Players.new('human1', 'X')
player2 = Players.new('human2', 'O')
game1 = Game.new(player1, player2)
puts game1.player1.name
game1.turn
