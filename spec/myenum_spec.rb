require 'myenum'

describe "Enumerable" do 

	let(:numbers) {[1,2,3,4]}
	describe '#count' do
		it 'returns the number of elements when no block is given' do
			expect(numbers.my_count).to eql(4)




		end
		it 'returns the correct number when a block is given' do
			expect(numbers.my_count{|c| c>2}).to eql(2)
		end

	end

	
end