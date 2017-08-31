

	@myproc = Proc.new {|first,second|  second.length<=>first.length }
def bubble_sort_by unsorted_array
	length = unsorted_array.length
	swapped = true
	while swapped
		count =0
		swapped = false
		while count<length-1
			
			if ( @myproc.call(unsorted_array[count],unsorted_array[count + 1]) == 1)
				unsorted_array[count] , unsorted_array[count +1] = unsorted_array[count+1] , unsorted_array[count]
				swapped = true
			end
			count +=1
		end
	end
	return unsorted_array
end








def bubble_sort unsorted_array
	length = unsorted_array.length
	swapped = true
	while swapped
		count =0
		swapped = false
		while count<length-1
			if (unsorted_array[count] > unsorted_array[count+1] )
				unsorted_array[count],unsorted_array[count +1] = unsorted_array[count+1],unsorted_array[count]
				swapped = true
			end
			count +=1
		end
	end
	return unsorted_array
end

my_array = ["happy", "sad","grumpy","bubblie", "zipporah"]
sorted_array = bubble_sort my_array
puts "sorted by bubbble #{sorted_array.inspect}"

sorted_array_yield = bubble_sort_by(my_array) 

puts "sorted by yield #{sorted_array_yield.inspect}"
