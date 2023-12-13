require_relative 'player'
require_relative 'question'

class Game
    def initialize
        @player1 = Player.new("Player 1")
        @player2 = Player.new("Player 2")
    end

    def game_loop
        current_player = @player1

        while @player1.lives > 0 && @player2.lives > 0
            question = Question.new
            question.ask

            player_answer = gets.chomp.to_i

            if question.check_answer(player_answer)
                puts "YES! You are correct.\n"
            else
                puts "Seriously? NO!\n"
                current_player.lose_life
            end
        
            puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3\n"
            puts "------- NEW TURN ------"

            current_player = (current_player == @player1) ? @player2 : @player1
        end

        declare_winner
    end

    def declare_winner
        if @player1.lives > 0 
            puts "Player 1 wins with a score of #{@player1.lives}/3"
        else
            puts "Player 2 wins with a score of #{@player2.lives}/3"
        end
        puts "------- GAME OVER ------"
        puts "Goodbye!"
    end
end
