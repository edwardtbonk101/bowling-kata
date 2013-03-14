require 'bowling'
require 'spec_helper'

describe 'score' do 
	it 'should accept rolls' do 
		bowling = Bowling.new
		bowling.score(20.times.map{ 0 }).should == 0
	end

	it 'should return 20 when all ones are rolled' do
		bowling = Bowling.new
		bowling.score(20.times.map { 1 }).should == 20
	end

	it 'should return 28 when a strike and 8 and 1 is rolled' do 
		bowling = Bowling.new
		bowling.score([10,8,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]).should == 44
	end

	it 'should return 42 when a spare and 8 and 1 is rolled' do 
		bowling = Bowling.new
		bowling.score([9,1,8,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]).should == 42
	end

	it 'should return 300 when all rolls are a strike' do
		bowling = Bowling.new
		bowling.score(12.times.map { 10 }).should == 300
	end

	it 'should return 100 when random rolls are made with a turkey in the 10th' do 
		bowling = Bowling.new
		bowling.score([1,1,8,1,9,1,5,5,1,1,0,8,9,1,0,5,4,4,10,10,10]).should == 100
	end

	it 'should return 73 with random assortment of spares are rolled' do 
		bowling = Bowling.new
		bowling.score([1,1,8,1,9,1,5,5,1,1,0,8,9,1,0,5,4,4,1,2]).should == 73
	end

	it 'should return 55 when 2 spares are rolled consecutively' do 
		bowling = Bowling.new
		bowling.score([9,1,5,5,5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]).should == 50
	end

	it 'should return 78 when a random assortment of spares and strikes are rolled' do
		bowling = Bowling.new
		bowling.score([1,1,8,1,10,5,5,1,1,0,8,9,1,0,5,4,4,1,2]).should == 78
	end

	it 'should return 38 when a spare is rolled in the 10th frame' do 
		bowling = Bowling.new
		bowling.score([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,10,1,9]).should == 38
	end

	it 'should return 38 when a spare is rolled in the 10th frame' do 
		bowling = Bowling.new
		bowling.score([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,10]).should == 38
	end

	it 'should return 75 when a strikes and spares are rolled consecutively' do 
		bowling = Bowling.new
		bowling.score([1,1,1,1,10,9,1,10,1,1,1,1,1,1,1,9,1,1]).should == 75
	end

	it 'should return 164 when all strikes and spares are rolled except for the 10th' do 
		bowling = Bowling.new
		bowling.score([1,9,1,9,10,9,1,10,10,1,9,1,9,1,9,9,1,1]).should == 164
	end

	it 'should return 30 when there is a strike in the 9th and only 1s in the 10th' do 
		bowling = Bowling.new
		bowling.score([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,10,1,1]).should == 30
	end

	it 'should return 245 when there is 9 strikes and 2 ones' do 
		bowling = Bowling.new
		bowling.score([10,10,10,10,10,10,10,10,10,1,1]).should == 245
	end

	it 'should return 245 when there is 9 strikes and 2 ones' do 
		bowling = Bowling.new
		bowling.score([10,10,10,10,10,10,10,10,10,10,1,1]).should == 273
	end

	it 'should return 29 when there is a strike in the 9th and only 1s in the 10th' do 
		bowling = Bowling.new
		bowling.score([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1,1]).should == 29
	end

end

describe 'spare_score' do 
	it 'should equal 10 plus the score of the next roll' do 
		bowling = Bowling.new
		bowling.spare_score(9) == 19
	end
end

describe 'strike_score' do 
	it 'should equal 10 plus the score of the next 2 rolls' do 
		bowling = Bowling.new
		bowling.strike_score(2,2) == 14
	end
end

describe 'spare?' do 
	it 'should return true when the sum of 2 frame rolls equals 10' do
		bowling = Bowling.new
		bowling.spare?(1,9).should == true
	end

		it 'should return true when the sum of 2 frame rolls does not equal 10' do
		bowling = Bowling.new
		bowling.spare?(0,9).should == false
	end
end

describe 'strike?' do 
	it 'should return true when a 10 is rolled' do 
		bowling = Bowling.new
		bowling.strike?(10).should == true
	end
end
	