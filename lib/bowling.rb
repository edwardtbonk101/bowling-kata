def score(roll)
	sum = 0
	i = 0
	while i < roll.count
		if strike?(roll[i])
			if (roll.length - i) <= 3
				sum += 10
				i+=1
			else
				sum += strike(roll[i+1], roll[i+2])
				i += 1
			end
		elsif((roll.length - i) > 1 && spare?(roll[i] ,roll[i+1])) 
			sum += spare(roll[i+2])
			i += 2
		else
			if roll.count - i > 1
				sum += roll[i] + roll[i+1]
				i += 2
			elsif roll.count - i == 1
				sum += roll[i]
				i+=1
			end
		end
	end
	return sum
end

def strike?(current_roll)
	current_roll == 10
end

def spare?(roll1, roll2)
	roll1 + roll2 == 10
end

def spare(spare_roll)
	spare_score = 10 + spare_roll
end

def strike(next_roll1, next_roll2)
	strike_score = 10 + next_roll1 + next_roll2
end

