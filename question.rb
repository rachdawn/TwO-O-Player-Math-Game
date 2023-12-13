class Question 
    def initialize(player_name)
        @player_name = player_name
    end

    def ask
        @val1 = rand(1..20)
        @val2 = rand(1..20)
        @correct_answer = @val1 + @val2

    puts "#{@player_name}: What does #{@val1} plus #{@val2} equal?"
    end
    
    def check_answer(player_answer)
        player_answer == @correct_answer
    end
end