class Game
	attr_accessor :board, :turn, :winner, :draw

	def initialize
		@board = "000000000"
		@turn = 0
		@winner = 0
		@draw = 0
	end

	def pretty_print
		puts self.board[0..2] + "\n" + self.board[3..5] + "\n" + self.board[6..8] + "\n\n"
	end

	def winner?
		# check 8 possible winning options (3 rows, 3 cols, 2 diagonals)
		if self.board[0].to_i * self.board[1].to_i * self.board[2].to_i == 1 || self.board[3].to_i * self.board[4].to_i * self.board[5].to_i == 1 || self.board[6].to_i * self.board[7].to_i * self.board[8].to_i == 1 || self.board[0].to_i * self.board[3].to_i * self.board[6].to_i == 1 || self.board[1].to_i * self.board[4].to_i * self.board[7].to_i == 1 || self.board[2].to_i * self.board[5].to_i * self.board[8].to_i == 1 || self.board[0].to_i * self.board[4].to_i * self.board[8].to_i == 1 || self.board[2].to_i * self.board[4].to_i * self.board[6].to_i == 1
			self.pretty_print
			puts "WINNER!"
			self.winner = 1
			return true

		elsif self.board[0].to_i * self.board[1].to_i * self.board[2].to_i == 8 || self.board[3].to_i * self.board[4].to_i * self.board[5].to_i == 8 || self.board[6].to_i * self.board[7].to_i * self.board[8].to_i == 8 || self.board[0].to_i * self.board[3].to_i * self.board[6].to_i == 8 || self.board[1].to_i * self.board[4].to_i * self.board[7].to_i == 8 || self.board[2].to_i * self.board[5].to_i * self.board[8].to_i == 8 || self.board[0].to_i * self.board[4].to_i * self.board[8].to_i == 8 || self.board[2].to_i * self.board[4].to_i * self.board[6].to_i == 8
			self.pretty_print
			puts "WINNER!"
			self.winner = 2
			return true
		end

		return false
	end

	def draw?
		product = 1
		self.board.chars.each do |char|
			product *= char.to_i
		end
		if !winner? && product != 0
			@draw = 1
			self.pretty_print
			puts "it's a DRAW!"
			return true
		else
			return false
		end
	end

	def move(location)
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
		self.winner?
		self.draw?
		self.pretty_print
	end

	def robo_move(location)

		if self.winner == 0 && self.draw == 0
				turn_flag = false
				while !turn_flag
					robo_location = rand(0..8)
					if board[robo_location] == "0"
						board[robo_location] = "1"
						turn_flag = true
					end
				end
		end
		if self.winner == 0 && self.board[location] == "0"
			self.board[location] = "2"
			self.winner?
			self.draw?
		end
		# self.winner?
		# self.draw?
		self.pretty_print
	end

	# check if a win is possible, priority 1
	def win_block_1_2(player)

		if player == 1
			product = 1
		else
			product = 4
		end

		if self.board[0] == "0" && (self.board[1].to_i * self.board[2].to_i == product || self.board[3].to_i * self.board[6].to_i == product || self.board[4].to_i * self.board[8].to_i == product )
			return 0
		elsif self.board[1] == "0" && (self.board[4].to_i * self.board[7].to_i == product || self.board[0].to_i * self.board[2].to_i == product)
			return 1
		elsif self.board[2] == "0" && (self.board[1].to_i * self.board[0].to_i == product || self.board[5].to_i * self.board[8].to_i == product || self.board[4].to_i * self.board[6].to_i == product)
			return 2
		elsif self.board[3] == "0" && (self.board[4].to_i * self.board[5].to_i == product || self.board[0].to_i * self.board[6].to_i == product)
			return 3
		elsif self.board[4] == "0" && (self.board[0].to_i * self.board[8].to_i == product || self.board[2].to_i * self.board[6].to_i == product || self.board[1].to_i * self.board[7].to_i == product || self.board[3].to_i * self.board[5].to_i == product)
			return 4
		elsif self.board[5] == "0" && (self.board[4].to_i * self.board[3].to_i == product || self.board[2].to_i * self.board[8].to_i == product)
			return 5
		elsif self.board[6] == "0" && (self.board[3].to_i * self.board[0].to_i == product || self.board[4].to_i * self.board[2].to_i == product || self.board[7].to_i * self.board[8].to_i == product)
			return 6
		elsif self.board[7] == "0" && (self.board[4].to_i * self.board[1].to_i == product || self.board[6].to_i * self.board[8].to_i == product)
			return 7
		elsif self.board[8] == "0" && (self.board[4].to_i * self.board[0].to_i == product || self.board[5].to_i * self.board[2].to_i == product || self.board[7].to_i * self.board[6].to_i == product)
			return 8
		else
			return -1
		end
	end

	def fork_block_fork_3_4(player)
		if player == 1
			sum = 1
		else
			sum = 2
		end

		if self.board[0] == "0"
			fork_count = 0
			if self.board[1].to_i * self.board[2].to_i == 0 && self.board[1].to_i + self.board[2].to_i == sum
				fork_count += 1
			end
			if self.board[4].to_i * self.board[8].to_i == 0 && self.board[4].to_i + self.board[8].to_i == sum
				fork_count += 1
			end
			if self.board[3].to_i * self.board[6].to_i == 0 && self.board[3].to_i + self.board[6].to_i == sum
				fork_count += 1
			end
			if fork_count > 1
				return 0
			end
		end

		if self.board[1] == "0"
			fork_count = 0
			if self.board[0].to_i * self.board[2].to_i == 0 && self.board[0].to_i + self.board[2].to_i == sum
				fork_count += 1
			end
			if self.board[4].to_i * self.board[7].to_i == 0 && self.board[4].to_i + self.board[7].to_i == sum
				fork_count += 1
			end
			if fork_count > 1
				return 1
			end
		end

		if self.board[2] == "0"
			fork_count = 0
			if self.board[1].to_i * self.board[0].to_i == 0 && self.board[1].to_i + self.board[0].to_i == sum
				fork_count += 1
			end
			if self.board[4].to_i * self.board[8].to_i == 0 && self.board[4].to_i + self.board[6].to_i == sum
				fork_count += 1
			end
			if self.board[5].to_i * self.board[8].to_i == 0 && self.board[5].to_i + self.board[8].to_i == sum
				fork_count += 1
			end
			if fork_count > 1
				return 2
			end
		end

		if self.board[3] == "0"
			fork_count = 0
			if self.board[0].to_i * self.board[6].to_i == 0 && self.board[0].to_i + self.board[6].to_i == sum
				fork_count += 1
			end
			if self.board[4].to_i * self.board[5].to_i == 0 && self.board[4].to_i + self.board[5].to_i == sum
				fork_count += 1
			end
			if fork_count > 1
				return 3
			end
		end

		if self.board[4] == "0"
			fork_count = 0
			if self.board[0].to_i * self.board[8].to_i == 0 && self.board[0].to_i + self.board[8].to_i == sum
				fork_count += 1
			end
			if self.board[1].to_i * self.board[7].to_i == 0 && self.board[1].to_i + self.board[7].to_i == sum
				fork_count += 1
			end
			if self.board[2].to_i * self.board[6].to_i == 0 && self.board[2].to_i + self.board[6].to_i == sum
				fork_count += 1
			end
			if self.board[3].to_i * self.board[5].to_i == 0 && self.board[3].to_i + self.board[5].to_i == sum
				fork_count += 1
			end
			if fork_count > 1
				return 4
			end
		end

		if self.board[5] == "0"
			fork_count = 0
			if self.board[3].to_i * self.board[4].to_i == 0 && self.board[3].to_i + self.board[4].to_i == sum
				fork_count += 1
			end
			if self.board[2].to_i * self.board[8].to_i == 0 && self.board[2].to_i + self.board[8].to_i == sum
				fork_count += 1
			end
			if fork_count > 1
				return 5
			end
		end

		if self.board[6] == "0"
			fork_count = 0
			if self.board[3].to_i * self.board[0].to_i == 0 && self.board[3].to_i + self.board[0].to_i == sum
				fork_count += 1
			end
			if self.board[4].to_i * self.board[2].to_i == 0 && self.board[4].to_i + self.board[2].to_i == sum
				fork_count += 1
			end
			if self.board[7].to_i * self.board[8].to_i == 0 && self.board[7].to_i + self.board[8].to_i == sum
				fork_count += 1
			end
			if fork_count > 1
				return 6
			end
		end

		if self.board[7] == "0"
			fork_count = 0
			if self.board[6].to_i * self.board[8].to_i == 0 && self.board[6].to_i + self.board[8].to_i == sum
				fork_count += 1
			end
			if self.board[4].to_i * self.board[1].to_i == 0 && self.board[4].to_i + self.board[1].to_i == sum
				fork_count += 1
			end
			if fork_count > 1
				return 7
			end
		end

		if self.board[8] == "0"
			fork_count = 0
			if self.board[6].to_i * self.board[7].to_i == 0 && self.board[6].to_i + self.board[7].to_i == sum
				fork_count += 1
			end
			if self.board[4].to_i * self.board[0].to_i == 0 && self.board[4].to_i + self.board[0].to_i == sum
				fork_count += 1
			end
			if self.board[5].to_i * self.board[2].to_i == 0 && self.board[5].to_i + self.board[2].to_i == sum
				fork_count += 1
			end
			if fork_count > 1
				return 8
			end
		end
	
		return -1

	end

	def get_center
		if self.board[4] == "0"
			return 4
		else
			return -1
		end
	end

	def get_opposite_corner
		if self.board[0] == "2"
			return 8
		elsif self.board[2] == "2"
			return 6
		elsif self.board[6] == "2"
			return 2
		elsif self.board[8] == "2"
			return 0
		else
			return -1
		end	
	end

	def get_corner
		if self.board[0] == "0"
			return 0
		elsif self.board[2] == "0"
			return 2
		elsif self.board[6] == "0"
			return 6
		elsif self.board[8] == "0"
			return 8
		else
			return -1
		end	
	end

	def get_side
		if self.board[1] == "0"
			return 1
		elsif self.board[3] == "0"
			return 3
		elsif self.board[5] == "0"
			return 5
		elsif self.board[7] == "0"
			return 7
		else
			return -1
		end	
	end

	def play_game
		while !self.winner? && !self.draw?
			self.pretty_print
			puts "turn: #{self.turn}"
			if self.turn % 2 == 0
				turn_flag = false
				while !turn_flag
					location = self.win_block_1_2(1)
					if location > -1 #checks if possible to win
						self.board[location] = "1"
						self.turn += 1
						turn_flag = true
					elsif self.win_block_1_2(2) > -1 #blocks opponent win
						location = self.win_block_1_2(2)
						self.board[location] = "1"
						self.turn += 1
						turn_flag = true
					elsif self.fork_block_fork_3_4(1) > -1 #checks for fork
						location = self.fork_block_fork_3_4(1)
						self.board[location] = "1"
						self.turn += 1
						turn_flag = true
					elsif self.fork_block_fork_3_4(2) > -1 #blocks opponent fork
						location = self.fork_block_fork_3_4(2)
						self.board[location] = "1"
						self.turn += 1
						turn_flag = true
					elsif self.get_center > -1 #checks for empty center
						self.board[4] = "1"
						self.turn += 1
						turn_flag = true
					elsif self.get_opposite_corner > -1 #gets opp corner if opp has corner
						location = self.get_opposite_corner
						self.board[location] = "1"
						self.turn += 1
						turn_flag = true
					elsif self.get_corner > -1 #gets a corner
						location = self.get_corner
						self.board[location] = "1"
						self.turn += 1
						turn_flag = true
					elsif self.get_side > -1 #gets a side
						location = self.get_side
						self.board[location] = "1"
						self.turn += 1
						turn_flag = true
					else
						robo_location = rand(0..8)
						if board[robo_location] == "0"
							board[robo_location] = "1"
							self.turn += 1
							turn_flag = true
						end
					end
				end
			else
				turn_flag = false
				while !turn_flag
					puts "Make your move."
					move = gets.chomp.to_i
					if self.board[move] == "0"
						self.board[move] = "2"
						self.turn += 1
						turn_flag = true
					end
				end
			end
		end
	end

end

g = Game.new
g.play_game
# while g.winner == 0 && g.draw == 0
# 	puts "make your move"
# 	move = gets.chomp
# 	g.robo_move(move.to_i)
# end
# g.move(0)
# g.move(1)
# g.move(4)
# g.move(5)
# g.move(8)
# g.move(7)
# puts g.winner