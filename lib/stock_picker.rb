
#Find the difference between two consecutive values, this determines wether there is a rise or a fall
def generate_diff(int_array)
	count = 0
	diff_array = []

	while count+1 <int_array.length	do
		diff_array.push(int_array[count+1]-int_array[count])
		count += 1
	end
	return diff_array
end
#This method generates a random integer array
def generate_int_array (size=9000,range=(1..10000))
	int_array = []
	rand_generator = Random.new(130)
	size.times do
		int_array.push(rand_generator.rand(range))
	end
	return int_array
end

def find_max_diff (int_array,diff_array)
	
	temp_cycle = false
	
	max_rise = 0
	peakIndex, troughIndex,arrayIndex,tempindex = 0,0,0
	peak, trough,tempPeak = 0,0,
	temptroughIndex = nil
	temptrough = nil
	temptroughSet = false
	peakSet = false
	troughSet=false
	temprise = 0

	while (arrayIndex < diff_array.length) do
		

		if  (diff_array[arrayIndex]>0)
			if !peakSet
				peak = int_array[arrayIndex+1]
				peakIndex = arrayIndex
				peakSet = true
				
				if !troughSet
					trough = int_array[arrayIndex]
					troughIndex = arrayIndex
					troughSet = true
				end
				max_rise = peak - trough	
				
			end
			if temp_cycle
				if !temptroughSet
					
					temptrough = int_array[arrayIndex ]
					temptroughIndex = arrayIndex 
					temptroughSet = true
					temprise = diff_array[arrayIndex]
					tempPeak = int_array[arrayIndex+1]
					
					#puts "temp peak is #{tempPeak}"
					#puts "temp rise is #{temprise}"
					#puts "max rise is #{max_rise}"

				end


				if (int_array[arrayIndex+1] > tempPeak)
					temprise += ( int_array[arrayIndex + 1]-tempPeak)
					tempPeak = int_array[arrayIndex+1]
				end
			end


			if (int_array[arrayIndex+1] > peak)
				max_rise += ( int_array[arrayIndex + 1]-peak)
			
				peakIndex = arrayIndex + 1
			
				peak = int_array[peakIndex]
				#puts "max rise is #{max_rise}"
				
			end
			if (temprise > max_rise)
				peakIndex = arrayIndex + 1
				peak = int_array[peakIndex]
				max_rise = temprise
				
				temprise = 0
				trough = temptrough
				troughIndex =temptroughIndex
				temp_cycle = false
				

			end
		
		elsif (diff_array[arrayIndex]<0)
			

			if (int_array[arrayIndex+1] < trough) && !temp_cycle
				
			
				temptrough = int_array[arrayIndex + 1]
				temptroughIndex = arrayIndex+1
				temp_cycle = true
				temptroughSet = false
				
				
			end
			if temp_cycle && int_array[arrayIndex +1] < temptrough
				temptrough = int_array[arrayIndex + 1]
				temptroughIndex = arrayIndex+1
				temptroughSet = false
			end

						
		end
		arrayIndex += 1

	end
	return {:peak => peak, :peakIndex => peakIndex, :trough => trough, :troughIndex => troughIndex}
end

puts Time.now #included to measure the speed of the algorithm
int_array = generate_int_array
#int_array = [17,3,6,9,15,8,6,1,15]
diff_array = generate_diff(int_array)


#print "Int array is " + int_array.to_s
#puts " "
#puts " "
#print "Diff array is " + diff_array.to_s
#puts " "
#puts " "
pro = find_max_diff(int_array,diff_array)
puts pro
puts Time.now
