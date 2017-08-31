 
class Tictac
	attr_reader :tictac_board
	attr_accessor :o_positions, :x_positions
	WIN_COMBINATION = [[0,1,2],[3,4,5],[6,7,8],[1,4,7],[2,5,8],[0,3,6],[0,4,8],[2,4,6]]

	def initialize
		@tictac_board = []
		@tictac_board.fill(" ",0,9)
		@x_positions =[]
		@o_positions = []
		@key_array = (0..9).to_a
		

	end

	def has_won?(tictac_positions)
		tictac_positions.sort!
		tictac_positions.combination(3) do |combination|
			return true if WIN_COMBINATION.include? combination
		end
		return false

	end


	def render_tictac_board(key_array=@key_array,tictac_array=@tictac_board)

		count =0
		while count <3  do 
		 	puts "   |   |   ".rjust(30) + "   |   |   ".rjust(30)
		 	puts " #{key_array[count*3+0]} | #{key_array[count*3+1]} | #{key_array[count*3+2]} ".rjust(30) + " #{tictac_array[count*3+0]} | #{tictac_array[count*3+1]} | #{tictac_array[count*3+2]} ".rjust(30)
		 	puts "#{count==2 ? '   |   |   '.rjust(30): '___|___|___'.rjust(30)}#{count==2 ? '   |   |   '.rjust(30): '___|___|___'.rjust(30)}"
		 	count +=1
		end
	end
	def update_X(position)
		if @tictac_board[position] == " "
			@tictac_board[position] = "X"
			@x_positions << position
			@x_positions.sort!
			@key_array[position]=" "
			 true
		else
			false 
		end


	end
	def update_O(position)
		if @tictac_board[position] == " "
			@tictac_board[position] = "O"
			@o_positions << position
			@o_positions.sort!
			@key_array[position]=" "
			 true
		else

			false
		end
		

	end
	def full?
		return true unless @tictac_board.include? " "
		false
	end


end


	myboard = Tictac.new
	winner = false
	system "clear"
	myboard.render_tictac_board
	puts "Hello there, lets play"
	puts "Input the name of player X"
	playerX = gets.chomp.to_sym
	puts "Input the name of Player Y"
	playerY = gets.chomp.to_sym
	puts "#{playerX} will be X and will go first and #{playerY} will be O and will go next ok?"
	gets
	puts "its not like you have an option.. may the smartest win!"
	puts "hit any key to continue....."
	system "clear"
	myboard.render_tictac_board
	9.times do 
		puts "#{playerX} make your move, pick a number"
		while true do
			xmove= gets.to_i #at this point, the implementation of playerX should make a move. todo: add implemenation of player X  
			if (myboard.update_X(xmove))
				break 
			else
				puts "invalid selection, try again"
			end
		end
		system "clear"
		myboard.render_tictac_board
		if myboard.has_won?(myboard.x_positions)
			puts "Congratulations, #{playerX}, you win!!!"
			winner = true
			break
		end
		break if myboard.full?

		puts "#{playerY} make your move, pick a number"
		while true do
			omove= gets.to_i
			if (myboard.update_O(omove))
				break 
			else
				puts "invalid selection, try again"
			end
		end
		system "clear"
		myboard.render_tictac_board
		if myboard.has_won?(myboard.o_positions)
			puts "Congratulations, #{playerY}, you win!!!"
			winner = true
			break
		end
		break if myboard.full?
	end
	puts "Its a tie.. sooo disappointing :(" if !winner 


