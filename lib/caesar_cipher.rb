def shift_ord (range,letter_ord, key)
	new_ord = letter_ord + key
	if !(range===new_ord) 
		new_ord = new_ord-range.last + range.first - 1
	end
	return new_ord

end

def encrypt (message_array, key=4)
	small_letters = (97..122)
	cap_letters = (65..90)
	key =key%25
	count = 0
	message_array.each do |letter|
			letter_ord = letter.ord
			new_ord = letter_ord
		if cap_letters===letter_ord
			
			new_ord = shift_ord(cap_letters,letter_ord,key)
		elsif small_letters===letter_ord
			new_ord = shift_ord(small_letters,letter_ord,key)
			
			
		end
		message_array[count]=new_ord.chr
		
	count+=1
	end
	return message_array
end	


puts "what is your message"
msg = gets 
msg_array = msg.split("")

puts "what is your key \nHit Enter for default "
key = gets 
encrypt_array=encrypt(msg_array,key.to_i)
puts encrypt_array.join