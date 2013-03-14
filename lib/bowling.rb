class Bowling
	def score(roll)
		sum = 0
		i = 0
		
		(1..9).each do
		a = roll[i]
		b = roll[i+1]
		c = roll[i+2]
			if strike?(a)
				sum += strike_score(b, c)
				i+=1
			elsif spare?(a, b)
				sum += spare_score(c)
				i+=2
			else
				sum += a + b
				i+=2
			end
		end

		while i < roll.length
			sum += roll[i]
			i+=1
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

	def strike?(current_roll)
		current_roll == 10
	end
end

