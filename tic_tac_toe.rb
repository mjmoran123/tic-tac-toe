class Game
	attr_accessor :board, :turn

	def initialize
		@board = "000000000"
		@turn = 0
	end

	def pretty_print
		puts self.board[0..2] + "\n" + self.board[3..5] + "\n" + self.board[6..8]
	end
end

g = Game.new
g.pretty_print