require 'bowling'
require 'spec_helper'

describe 'score' do 
	it 'should accept rolls' do 
		score([2]).should == 2
	end
	it 'should return 20 when all ones are rolled' do
		score([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]).should == 20
	end
	it 'should return 28 when a strike and 8 and 1 is rolled' do 
		score([10,8,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]).should == 44
	end
	it 'should return 27 when a spare and 8 and 1 is rolled' do 
		score([9,1,8,1]).should == 27
	end	
	it 'should return 300 when all rolls are a strike' do
		score([10,10,10,10,10,10,10,10,10,10,10,10]).should == 300
	end
	it 'should return 100 when random rolls are made with a turkey in the 10th' do 
		score([1,1,8,1,9,1,5,5,1,1,0,8,9,1,0,5,4,4,10,10,10]).should == 100
	end
	it 'should return 73 with random assortment of spares are rolled' do 
		score([1,1,8,1,9,1,5,5,1,1,0,8,9,1,0,5,4,4,1,2]).should == 73
	end
	it 'should return 36 when 2 spares are rolled consecutively' do 
		score([9,1,5,5,5,1]).should == 36
	end
	it 'should return 78 when a random assortment of spares and strikes are rolled' do
		score([1,1,8,1,10,5,5,1,1,0,8,9,1,0,5,4,4,1,2]).should == 78
	end
	it 'should return 38 when a spare is rolled in the 10th frame' do 
		score([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,10,1,9]).should == 38
	end
	it 'should return 75 when a strikes and spares are rolled' do 
		score([1,1,1,1,10,9,1,10,1,1,1,1,1,1,1,9,1,1]).should == 75
	end
	it 'should return 164 when all strikes and spares are rolled except for the 10th' do 
		score([1,9,1,9,10,9,1,10,10,1,9,1,9,1,9,9,1,1]).should == 164
	end
end

describe 'more_than_one_frame?' do
	it 'should return true if there is more than one frame left' do 
		more_than_one_frame?(2).should == true
	end
	it 'should return false if there is less than one frame left' do 
		more_than_one_frame?(1).should == false
	end
end

describe 'tenth_frame?' do 
	it 'should return true if the number of frames is less than or equal to 3' do 
		tenth_frame?(2).should == true
	end
	it 'should return false if the number of frames left is greater than 3' do 
		tenth_frame?(4).should == false
	end
end

describe 'spare_score' do 
	it 'should equal 10 plus the score of the next roll' do 
		spare_score(9) == 19
	end
end

describe 'strike_score' do 
	it 'should equal 10 plus the score of the next 2 rolls' do 
		strike_score(2,2) == 14
	end
end

describe 'strike?' do 
	it 'should return true when a 10 is rolled' do 
		strike?(10).should == true
	end
	it 'should return false when a 9 is rolled' do 
		strike?(9).should == false
	end

end

describe 'spare?' do 
	it 'should return true when the sum of 2 frame rolls equals 10' do
		spare?(1,9).should == true
	end
		it 'should return true when the sum of 2 frame rolls does not equal 10' do
		spare?(0,9).should == false
	end
end