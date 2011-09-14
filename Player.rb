class Player

    attr_accessor :marker
    
    #Takes marker as initial parameter.
	def initialize(p = 'X')
		@marker = p
	end
	
    #Choose move function. Returns move.
	def chooseMove
		print "\nEnter your move human: "
		move = gets.chomp.to_i
		return move
	end
	

end
