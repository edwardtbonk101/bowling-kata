class Bowling
	def score(roll)
		sum = 0
		i = 0
		while i < roll.length

			a = roll.length-i
			b = roll[i+1]
			b2 = roll[i+2]
			c = roll[i]

			if ninth_frame_strike?(c, a) && no_extra_frames?((a - 1), b, b2)
				sum += strike_score(b, b2)
				i+=1
			elsif strike?(c) && tenth_frame?(a)
				sum += 10
				i+=1
			elsif strike?(c)
				sum += strike_score(b, b2)
				i+=1
			elsif more_than_one_frame?(a) && spare_in_tenth?(c ,b, a)
				sum += c
				i+=1
			elsif more_than_one_frame?(a) && spare?(c ,b)
				sum += spare_score(b2)
				i+=2
			elsif more_than_one_frame?(a)
				sum += c + b
				i+=2
			else
				sum += c
				i+=1
			end
		end
		return sum
	end

	def spare_score(spare_roll)
		spare_score = 10 + spare_roll
	end

	def strike_score(next_roll, next_roll2)
		strike_score = 10 + next_roll + next_roll2
	end

	def spare?(current_roll, next_roll)
		current_roll + next_roll == 10
	end

	def spare_in_tenth?(current_roll, next_roll, rolls_left)
		current_roll + next_roll == 10 && rolls_left <= 3
	end

	def strike?(current_roll)
		current_roll == 10
	end

	def more_than_one_frame?(rolls_left)
		rolls_left > 1 
	end
	
	def tenth_frame?(current_frame)
		current_frame <= 3
	end

	def ninth_frame_strike?(current_roll, rolls_left)
		current_roll == 10 && rolls_left <=3
	end
	
	def no_extra_frames?(rolls_left, next_roll1, next_roll2)
		rolls_left == 2 && next_roll1 + next_roll2 < 10
	end
end

