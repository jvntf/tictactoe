class String
  def each_char
    self.split("").each { |i| yield i }
  end
end

class Square
	attr_reader :value
	attr_writer :value
	def initialize
		@value = "-"
	end
	
	def make_move(choice)
		@value=choice
	end
end



class Board
	def initialize
		create_squares
		
		@row_top =[" ","1"," ","2"," ","3"]
		@row1    =["a",@a_1,"|",@a_2, "|",@a_3]
		@row2    =["b",@b_1,"|",@b_2, "|",@b_3]
		@row3    =["c",@c_1,"|",@c_2, "|",@c_3]

	end
	
	def create_squares
		
		$squares = Hash.new
		
		@a_1 = Square.new
		@a_2 = Square.new
		@a_3 = Square.new
		$squares["a1"] = @a_1
		$squares["a2"] = @a_2
		$squares["a3"] = @a_3
		
		
		@b_1 = Square.new
		@b_2 = Square.new
		@b_3 = Square.new
		$squares["b1"] = @b_1
		$squares["b2"] = @b_2
		$squares["b3"] = @b_3
		
		@c_1 = Square.new
		@c_2 = Square.new
		@c_3 = Square.new
		$squares["c1"] = @c_1
		$squares["c2"] = @c_2
		$squares["c3"] = @c_3
		
	end
	
	def print_board
		@row_top.each do |item|
			print item + " "
		end
		puts
		@row1.each do |item|
			if item.class==Square
				print item.value.to_s + " "
			else print item + " "
			end
		end
		puts
		@row2.each do |item|
			if item.class==Square
				print item.value.to_s + " "
			else print item + " "
			end
		end
		puts
		@row3.each do |item|
			if item.class==Square
				print item.value.to_s + " "
			else print item + " "
			end
		end
		puts
	
	end
	
end

class Player
	attr_reader :name
	attr_reader :symbol
	def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end
end
		

board = Board.new
puts "Let's play tic-tac-toe"
board.print_board


puts
puts "Player One enter name: "
name_1 = gets.chomp
puts "Choose symbol (x/o): "
symbol_1 = gets.chomp
player1 = Player.new(name_1, symbol_1)

puts "Player Two enter name: "
name2 = gets.chomp
symbol_2= symbol_1 =='x'? 'o' : 'x'
player2 = Player.new(name2,symbol_2)


puts "Player one move"
puts "input coordinate in letter-number format (i.e. a1)"

puts "Player 1's turn:"
$squares[gets.chomp].make_move(player1.symbol)
board.print_board

puts "Player 2's turn:"
$squares[gets.chomp].make_move(player2.symbol)
board.print_board



row1 = ["a1","a2","a3"]
row2 = ["b1","b2","b3"]
row3 = ["c1","c2","c3"]
col1 = ["a1","b1","c1"]
col2 = ["a2","b2","c2"]
col3 = ["a3","b3","c3"]
x1=["a1","b2","c3"]
x2=["a3","b2","c1"]
		
		$poss_winners = [row1,row2,row3,col1,col2,col3,x1,x2]


def check_winner

	$poss_winners.each do |group|
		print group.to_s
			first = $squares[group[0]].value
			print "Hello"
		
			if $squares[group[1]].value != first
				print $squares[group[1]].value
				break
			elsif $squares[group[2]].value !=first
				print $squares[group[2]].value
				break
			elsif $squares[group[2]].value ==first
				print $squares[group[2]].value
				return true
			else
				next
			end
	end
	return false

end





$win = true
while $win do
	
	puts "Player 1's turn:"
	$squares[gets.chomp].make_move(player1.symbol)
	board.print_board
	
	puts "Player 2's turn:"
	$squares[gets.chomp].make_move(player2.symbol)
	board.print_board

	check_winner
	
end
puts "you win"


	
	

