#* Author:	Jakub Misterka
#*
#* Date: 		09/2011
#*

class Board
  #attr_accessor :bo
  
  #Creates new array/Sets indices to 0-8
  def initialize
	@bo = Array.new(8)
	for i in 0..8
		@bo[i] = '-'
	end
  end
 
    #Resets array to first state
  def reset
	for i in 0..8
		@bo[i] = '-'
	end
  end 
 
    #Prints the board at current state along with key
  def printBoard
	key = 0
	for i in 1..9
		print "[ #{@bo[i-1]} ]"
		if i % 3 == 0 then 
			print "    "
			0.upto(2) do
				print "[ #{key} ]"
				key = key + 1
			end
			print "\n"
		end
	end
  end
      
    #Places a move on the board, checks for validity, returns nil if not Valid
  def move(pos, player)
      #Special case for negamax to reset board as recursively pops back up
    if player == '-' then
      @bo[pos] = '-'
      end	
      #Check validity of move
	if isValidMove(pos) then
		@bo[pos] = player
	else
        puts "Invalid Move"
		return nil
	end
  end
    
    #Checks if tile selected is a valid selection. Returns true if valid otherwise false.
  def isValidMove(pos)
	if pos < 0 || pos > 8
		print "Invalid move. Try again human. \n"
		return false
	elsif @bo[pos] == '-' then
		return true
	else 
		return false
	end
  end

    #Checks if there is a winner. Takes player.marker as parameter. If winner, returns the player marker. Else, return nil.
  def winCondition(player)
      #Loops through rows, then loops through columns.
	for i in 0..2
		check = i*3
		if(@bo[check] == player && @bo[check+1] == player && @bo[check+2] == player) then
			return player
		end
		if(@bo[i] == player && @bo[i+3] == player && @bo[i+6] == player) then
			return player
		end
	end
      #Loops through diagonals
	if(@bo[0] == player && @bo[4] == player && @bo[8] == player) then
		return player
	end
	if(@bo[2] == player && @bo[4] == player && @bo[6] == player) then
		return player
	end
	return nil
  end
  
    #Checks is board is full
  def isFull
	@bo.each do |i| 
		if i == '-' then 
			return false
		end
	end
	return true
  end

end
