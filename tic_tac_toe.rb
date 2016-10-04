class Game
	attr_accessor :board, :turn

	def initialize
		@board = "000000000"
		@turn = 0
	end

	def pretty_print
		puts self.board[0..2] + "\n" + self.board[3..5] + "\n" + self.board[6..8] + "\n\n"
	end

	def move(location)
		if self.board[location] == "0"
			if self.turn % 2 == 0
				self.board[location] = "1"
			else
				self.board[location] = "2"
			end
			self.turn += 1
		else
			puts "location is occupied"
		end
		self.pretty_print
	end

end

g = Game.new
g.pretty_print
g.move(1)
g.move(8)