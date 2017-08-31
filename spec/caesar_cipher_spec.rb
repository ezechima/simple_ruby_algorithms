require 'caesar_cipher'

describe '#encrypt' do 
	context 'when given letters' do

		it 'shifts the letter by 4' do
			expect(encrypt(["A","B"])).to eql(["E","F"])
		end

		it "doesn't transform capital letter to small letters" do
			expect(encrypt(["Z"])).to eql(["D"])
		end

		it "only works on alphabets" do
			expect(encrypt(["%"," ","^"])).to eql(["%"," ","^"])
		end


	end

	
end