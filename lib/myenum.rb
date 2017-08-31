#myenum.rb.. written to experiment with how modules can be used

module Enumerable
	def my_each
		index = 0
		self.size.times do 
			yield self[index]
			index +=1
			
		end
	end
	def my_each_with_index
		index = 0
		self.my_each do |item| 

			yield(item, index)
			index +=1
		end

	end
	def my_select
		result = []
		self.my_each do |obj|
			if yield(obj)
				result << obj
			end
		end
		return result
	end
	def my_all?
		if block_given?

			self.my_each do |obj|
				if !yield(obj)
					return false
				end
			end
			return true
		else
			self.my_each do |obj|
				if !obj
					return false
				end
			end
			return true
		end

	end
	def my_any?
		if block_given?

			self.my_each do |obj|
				if yield(obj)
					return true
				end
			end
			return false
		else
			self.my_each do |obj|
				if obj
					return true
				end
			end
			return false
		end
	end
	def my_none?
	end
	def my_count (*args)
		count = 0
		if block_given?

			self.my_each do |obj|
				if yield(obj)
					count += 1

				end
			end

		elsif args.empty?
			return self.length
		else 
			self.my_each do |obj|
				if obj == args[0]
					count+=1
				end
			end
		end
		return count
				
	end
	
	def my_map
		map_array = []
		self.my_each do |obj|
			map_array << yield(obj)
		end
		return map_array

	end
	def my_map(&proc)
		map_array = []
		self.my_each do |obj|
			
			map_array<<proc.call(obj)
		end
		return map_array
	end

	def my_inject(*args)
		initial_available = false
		symbol_given = false
		
		initial = nil
		symbol = nil
		memo = nil
		index = 0

		case args.length
		when 0 
			throw Exception("no block given") if !block_given? 
						
		when 1
			if args[0].is_a? Symbol
				symbol_given = true
				symbol = args[0]
			else
				initial = args[0]
				initial_available = true
			end
		when 2
			if args[1].is_a? Symbol
				initial = args[0]
				initial_available = true
				symbol_given = true
				symbol = args[1]
			else
				puts "#{args[1]} is not a symbol"
			end
		end
		self.my_each do |obj|
			if !initial_available 
				initial = obj
				initial_available = true
				next
			end
			if symbol_given
				
					initial = initial.send(symbol,obj)
		
				
			elsif block_given?
				
					initial = yield(initial, obj )
				
				
			end
		end
		return initial








	end


end


