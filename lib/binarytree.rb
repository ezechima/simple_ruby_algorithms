class TreeNode_c
	attr_accessor :value, :parent, :left, :right   # variables that hold the value, parent node, left node, and right node

	def initialize (value, parent = nil, left = nil, right = nil)  #initialize all nodes to nil on creation.
		@value = value
		@parent = parent
		@left = left
		@right = right

		
	end
	def hasleft?
		return true if @left
		false
	end
	def hasright?
		return true if @right
		false
	end


	def to_s
		" #{@value}, (left#{@value}: #{@left}, right#{@value}: #{@right})"
	end

end

class BinaryTree_c

	attr_accessor :root
	def initialize (root)

		root = TreeNode_c.new(root)
		@root = root

	end
	

	def insert(node, item)

		if node == nil
			node = TreeNode_c.new(item)
		elsif item<= node.value
			node.left = insert(node.left,item)
		else
			node.right = insert(node.right, item)
		end
		return node

	end
	def breadth_first_search(binarytree,data)
		stack = [binarytree.root]
		stack.each do |node|
			return node if node.value == data
			print "#{node.value} "
			stack.push(node.left) if node.hasleft? 
			stack.push(node.right) if node.hasright?
		end
		nil

	end
	def depth_first_search(root,data)
		#move items to right stack if they have
		leftstack = [root]
		rightstack = []
		
		begin 
			while !leftstack.empty? do
				if leftstack[0].hasleft?
					tmp = leftstack.shift 
					leftstack.unshift(tmp.left)  #shift the first element, and unshift the node to the left of the first element
					rightstack.unshift(tmp)
				else

					print "#{leftstack[0].value} "  #processing to be done
					tmp = leftstack.shift
					leftstack.unshift(tmp.right) if tmp.hasright?
				end
				while !rightstack.empty? && leftstack.empty? do
					print "#{rightstack[0].value} "
					tmp =rightstack.shift
					leftstack.unshift(tmp.right) if tmp.hasright?

				end
			end


		end until leftstack.empty? && rightstack.empty?
	end
	
	def dfs_rec(root,data)
		if root.value ==data
			puts root.value
			return root
		else
		
			dfs_rec(root.left, data) if root.hasleft?

		
		
			dfs_rec(root.right,data) if root.hasright?
		end

		nil

	end


	def self.populate_random(array)

		random_array = array.sample(array.length)
		binarytree = BinaryTree_c.new(random_array.delete_at(0))
		random_array.each {|x| binarytree.insert(binarytree.root, x)}
		binarytree

	end
	def self.populate_sorted(sorted_array)
		root = sorted_array.delete_at(sorted_array.length/2)
		binarytree = BinaryTree_c.new(root)
		
		return pop_sorted_binarytree(binarytree,sorted_array)
	end
	
	private


	def self.pop_sorted_binarytree(binarytree,array)
		
		binarytree.insert(binarytree.root,array.delete_at(array.length/2))
		len = array.length
		if len == 1
			binarytree = pop_sorted_binarytree(binarytree,array)
		elsif len > 1
			binarytree = pop_sorted_binarytree(binarytree,array[0...len/2])
			binarytree = pop_sorted_binarytree(binarytree,array[len/2...len])
		end

		binarytree
	end
end

