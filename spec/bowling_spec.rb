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
	it 'should return 100' do 
		score([1,1,8,1,9,1,5,5,1,1,0,8,9,1,0,5,4,4,10,10,10]).should == 100
	end
	it 'should return 73' do 
		score([1,1,8,1,9,1,5,5,1,1,0,8,9,1,0,5,4,4,1,2]).should == 73
	end
	it 'should return 36' do 
		score([9,1,5,5,5,1]).should == 36
	end
	it 'should return ' do
		score([1,1,8,1,10,5,5,1,1,0,8,9,1,0,5,4,4,1,2]).should == 78
	end
end

describe 'spare' do 
	it 'should equal 10 plus the score of the next roll' do 
		spare(9) == 19
	end
end

describe 'strike' do 
	it 'should equal 10 plus the score of the next 2 rolls' do 
		strike(2,2) == 14
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