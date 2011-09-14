class AI < Player

    #Takes board and marker as parameter.
	def initialize(p = 'O', board)
		@board = board
		@marker = p
	end
	
    #negamax algorithm for calculating best moves.
    #Naive implementation chooses winning move because tiles all have same value (1).
	def negamax(p = @marker, depth = 0)
		
			if @board.winCondition(p) then 
				return 1
			elsif @board.winCondition(p == 'O' ? 'X' : 'O') 
				return -1
			elsif @board.isFull
				return 0
			end
			
		best = -10000
		bestmove = -10000
		
		for i in 0..8
			if @board.isValidMove(i) then
				@board.move(i, p)
				value = -negamax(p == 'O' ? 'X' : 'O', depth + 1)
				@board.move(i, '-')
				if value > best then
					best = value
					@bmove = i if depth == 0
				end
			end
		end		
		return best	
	end	
	
    #Runs negamax and returns move. Overridden function from Player class.
	def chooseMove
		negamax
		return @bmove
	end
	
end