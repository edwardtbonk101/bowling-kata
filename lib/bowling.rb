class Bowling
	def score(roll)
		sum = 0
		i = 0
		while i < roll.length
			if strike?(roll[i]) && tenth_frame?(roll.length - i) && two_frames_left?(roll.length - i-1) && no_extra_frames?(roll[i+1], roll[i+2])
				sum += strike_score(roll[i+1], roll[i+2])
				i+=1
			elsif strike?(roll[i]) && tenth_frame?(roll.length - i)
				sum += 10
				i+=1
			elsif strike?(roll[i])
				sum += strike_score(roll[i+1], roll[i+2])
				i+=1
			elsif more_than_one_frame?(roll.length - i) && spare?(roll[i] ,roll[i+1]) && tenth_frame?(roll.length - i)
				sum += roll[i]
				i+=1
			elsif more_than_one_frame?(roll.length - i) && spare?(roll[i] ,roll[i+1])
				sum += spare_score(roll[i+2])
				i+=2
			elsif more_than_one_frame?(roll.length - i)
				sum += roll[i] + roll[i+1]
				i+=2
			else
				sum += roll[i]
				i+=1
			end
		end
		return sum
	end

	def two_frames_left?(frames_left)
		frames_left == 2
	end

	def no_extra_frames?(next_roll1, next_roll2)
		next_roll1 + next_roll2 < 10
	end

	def more_than_one_frame?(frames_left)
		frames_left > 1 
	end
	
	def tenth_frame?(current_frame)
		current_frame <= 3
	end
	
	def strike?(current_roll)
		current_roll == 10
	end
	
	def spare?(current_roll, next_roll)
		current_roll + next_roll == 10
	end
	
	def spare_score(spare_roll)
		spare_score = 10 + spare_roll
	end
	
	def strike_score(next_roll1, next_roll2)
		strike_score = 10 + next_roll1 + next_roll2
	end
end