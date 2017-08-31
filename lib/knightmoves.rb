#program demonstrating the shortest number of moves a Knight can make from one location to another on a chess board
#usage Knight.new([start_locatin as array],[end_location as  array]).start




class KnightBoard
	attr_reader :board


	KNIGHT_MOVES = [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]


	def initialize 
		@board = Array.new(8) {Array.new(8)}  #the game board, an 8*8 array
	end
	def is_checked?(location)   #metod to check the current location has been inspected, location is of the form [x,y]

		!@board[location[0]][location[1]].nil?

	end

	def possible_moves(current_location)   #method to check the possible moves that can be made by the Knight
		possible_moves = []
		KNIGHT_MOVES.each do |move|
			xmove= move[0] + current_location[0]
			ymove= move[1] + current_location[1]
			possible_moves << [xmove,ymove] if (((0..7) === xmove) && ((0..7) === ymove ) && !is_checked?([xmove,ymove]))
		end
			
		possible_moves
		
	end
	def add_node(node,location)
		if !is_checked?(location) 
		 @board[location[0]][location[1]] = node
		 node.current_location = location
		 return node
		end
		nil
	end

end
class KnightNode
	#class that represents the nodes
	#the nodes will be able to track the shortest moves between the source and the node location.
	attr_accessor :previous_moves, :current_location

	def initialize (current_location=nil, previous_moves=[])
		@current_location =  current_location
		@previous_moves = previous_moves
	end
	def to_s
		@current_location.inspect
	end

end

class Knight
	attr_reader :knightboard, :start_node, :queue

	def initialize (starting_location, ending_location =nil)

		@knightboard = KnightBoard.new
		@start_node = @knightboard.add_node(KnightNode.new(),starting_location)
		@queue = [@start_node]
		@ending_location = ending_location

	end
	def update_previous_moves(new_node, old_node)
			old_node.previous_moves.each{|move| new_node.previous_moves.push(move)}
			new_node.previous_moves.push(old_node.current_location)
			return new_node	
			
	end
	def displayresult(node)
		puts "You made it in #{node.previous_moves.length} moves! Here is your path:"
		node.previous_moves.each { |move| puts move.inspect}
		puts node.current_location.inspect
		
	end

	def start
		@queue.each do |node|
			possible_moves = @knightboard.possible_moves(node.current_location)
			possible_moves.each do |move|
				move_node = @knightboard.add_node(KnightNode.new(), move)
				move_node = update_previous_moves(move_node,node)
				
				if ((move[0] == @ending_location[0]) && (move[1] == @ending_location[1]))  #to do, get a cleaner way of doing this
					displayresult(move_node)
					return
				end
				@queue.push(move_node)

			end

		end


	end



end


