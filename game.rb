class Game  
  def initialize
    @player1 = Player.new()
    @player2 = Player.new()
    @current_player = @player1
    @game_over = false
  end

  def display_players
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def start

    while !@game_over
        question = Question.new
        print @current_player == @player1 ? "Player 1: " : "Player 2: "
        puts question.ask_question

        if question.check_answer?
            puts "YES! You are correct."
          else 
            puts "Seriously? No!"
            @current_player.lose_life 
        end

        display_players
        puts "----- NEW TURN -----"

        if @current_player.lives == 0
          @game_over = true
          puts "Player #{@current_player == @player1 ? 2 : 1} wins with a score of #{@current_player == @player1 ? @player2.lives : @player1.lives}/3"
          puts "----- GAME OVER -----"
          puts "Good bye!"
        end

        @current_player = (@current_player == @player1) ? @player2 : @player1
    end
  end
end