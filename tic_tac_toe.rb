class Game
	attr_accessor :board, :turn, :winner

	def initialize
		@board = "000000000"
		@turn = 0
		@winner = 0
	end

	def pretty_print
		puts self.board[0..2] + "\n" + self.board[3..5] + "\n" + self.board[6..8] + "\n\n"
	end

	def winner?
		# check 8 possible winning options (3 rows, 3 cols, 2 diagonals)
		if self.board[0].to_i * self.board[1].to_i * self.board[2].to_i == 1 || self.board[3].to_i * self.board[4].to_i * self.board[5].to_i == 1 || self.board[6].to_i * self.board[7].to_i * self.board[8].to_i == 1 || self.board[0].to_i * self.board[3].to_i * self.board[6].to_i == 1 || self.board[1].to_i * self.board[4].to_i * self.board[7].to_i == 1 || self.board[2].to_i * self.board[5].to_i * self.board[8].to_i == 1 || self.board[0].to_i * self.board[4].to_i * self.board[8].to_i == 1 || self.board[2].to_i * self.board[4].to_i * self.board[6].to_i == 1
			puts "WINNER!"
			self.winner = 1
			return true

		elsif self.board[0].to_i * self.board[1].to_i * self.board[2].to_i == 8 || self.board[3].to_i * self.board[4].to_i * self.board[5].to_i == 8 || self.board[6].to_i * self.board[7].to_i * self.board[8].to_i == 8 || self.board[0].to_i * self.board[3].to_i * self.board[6].to_i == 8 || self.board[1].to_i * self.board[4].to_i * self.board[7].to_i == 8 || self.board[2].to_i * self.board[5].to_i * self.board[8].to_i == 8 || self.board[0].to_i * self.board[4].to_i * self.board[8].to_i == 8 || self.board[2].to_i * self.board[4].to_i * self.board[6].to_i == 8
			puts "WINNER!"
			self.winner = 2
			return true
		end

		return false
	end

	def move(location)
		self.winner?
		if self.winner == 0 && self.board[location] == "0"
			if self.turn % 2 == 0
				self.board[location] = "1"
			else
				self.board[location] = "2"
			end
			self.turn += 1
		else
			puts "nope!"
		end
		self.pretty_print
	end

end

g = Game.new
g.pretty_print
# g.move(0)
# g.move(1)
# g.move(4)
# g.move(5)
# g.move(8)
# g.move(7)
# puts g.winner