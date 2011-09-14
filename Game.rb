require './Board.rb'
require './Player.rb'
require './AI.rb'

class Game

    #Starts a new board with two players, one ai, and the other human. Defaults @currentPlayer to human.
	def initialize
		@board = Board.new
		@player1 = Player.new
		@player2 = AI.new(@board)
		@currentPlayer = @player1
	end
	
    #Begins the game and asks player if he/she wants to go first
	def start
		puts "\nI am Negaman. Are you ready... Human?"
		
		print "\nWould you like to go first? (y/n): "
		check = gets.chomp

		while !confirm(check)
		check = gets.chomp
		end

		if check == 'n'then @currentPlayer = @player2
        else @currentPlayer = @player1
		end
        
		gameLogic
		
	end
	
    #The game loop.
	def gameLogic
	
		while(!@board.isFull)
		
			@board.printBoard
		
			if @currentPlayer == @player2 then print "\nNegaman's Move\n\n" end
				
			while @board.move(@currentPlayer.chooseMove, @currentPlayer.marker) == nil
			end
			
            whoWon
			
			switchPlayer
		end
		
		puts "\n    DRAW!\n\n"
        @board.printBoard
		
        finish
	
	end
	
    #Switches current player.
	def switchPlayer
		if @currentPlayer == @player1 then
			@currentPlayer = @player2
		else
			@currentPlayer = @player1
		end
	end
    
    #Asks to play again, else exit.
    def finish
        print "\nWould you like to play again? (y/n)"
        answer = gets.chomp
	if answer == "y" then
		@board.reset
		self.start
	elsif answer == "n" then
		exit
	else
		print "\nIncorrect command\n"
        finish
		exit
	end
    end
    
    #Checks which player won.
    def whoWon
        if @board.winCondition(@player1.marker)
            @board.printBoard
            puts "\n     Human Player Wins!\n"
            finish
        elsif @board.winCondition(@player2.marker)
            @board.printBoard
            puts "\n     Negaman Wins! I have defeated you, human.\n"
            finish
        end
    end
        
    #Confirmation function, checks for (y/n) input.
    def confirm(check)
        if check == "y" || check == "n" then
            return true
        else 
            puts "\nInvalid Input. Try again Human. (y/n)?"
            return false
        end
    end

end
