#simple program demonstrating merge sort  using recursion
module MergeSort_C2 
    extend  self
    
    def split(array)
        len = array.length
        len == 1 ? [array] : [array[0..len/2-1],array[len/2..len-1]]
    end
    def merge(array_a, array_b)
        
        merged_array = []
        while(array_a.length>0 && array_b.length > 0) do
            merged_array.push(array_a[0] <= array_b[0] ? array_a.shift : array_b.shift)
        end
        #array_a.length == 0 ? array_b.each{|item| merged_array.push(item)} : array_a.each{|item| merged_array.push(item)}
        

        return merged_array + array_a +array_b
        
    end
    def small_sort(small_array)

        if small_array.length == 1 || small_array[0] < small_array[1]
            return small_array 
        else
            small_array[0],small_array[1] = small_array[1],small_array[0]
            return small_array
        end

    end

    def merge_sort (unsorted_array)
        splitarray=split(unsorted_array)
        split_a = splitarray[0]
        split_b = splitarray[1] ? splitarray[1] : []

        merge(split_a.length > 1 ? merge_sort(split_a) : split_a, split_b.length > 1 ? merge_sort(split_b) : split_b)
        
    end
end

