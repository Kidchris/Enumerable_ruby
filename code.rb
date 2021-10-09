module Enumerable

     ################################################################
     def my_each
        
        return to_enum(:my_each) unless block_given?
        for i in self
            yield i
        end
     end
     ################################################################
     def my_each_with_index

        return to_enum(:my_each) unless block_given?

        for k in 0...self.length 
            yield self[k], k
        end
     end
     ################################################################
     def my_select(&block)
        
        return to_enum(:my_select) unless block_given?

        self.my_each do |value|
          puts value if block.call(value)
        end
     end 
     ################################################################
     def my_all?(&block)

        return to_enum(:my_select) unless block_given?
        return false if self.length == 0

        vars = []
        self.my_each do |value| vars.push true if block.call(value) end
         if vars.length == self.length
            return true
         else
            return false
         end
     end
     ################################################################
     def my_any?(&block)
        return to_enum(:my_select) unless block_given?
        return false if self.length == 0

        vars = []
        self.my_each do |value| vars.push true if block.call(value) end
         if vars.length >=1
            return true
         else
            return false
         end
     end
     ################################################################

     def my_none?(&block)
        return to_enum(:my_select) unless block_given?
        return true if self.length == 0

        vars = []
        self.my_each do |value| vars.push true if block.call(value) end
         if vars.length == 0
            return true
         else
            return false
         end
     end
     ################################################################

     def my_count(value=nil)
        
        return self.length if value.nil?
        len = 0
        for i in 0...self.size
            if value == self[i]
                len +=1
            end
        end

        return len
     end
     ################################################################

     def my_map(&block)

        return to_enum(:my_select) unless block_given?
        return nil if self.length == 0
        newArray = []
        self.my_each{|value| newArray.push  block.call(value)}
        return newArray
        
     end
     ################################################################
def my_inject(accumulator=nil, &block)
    self.class == Range ? arr = self.to_a : arr = self
    if block_given?
      if accumulator.nil?
        accumulator = self.first
        for i in 0..arr.size-2
          accumulator = block.call(accumulator, arr[i+1])
        end
      elsif accumulator
        for i in 0..arr.size-1
          accumulator = block.call(accumulator, arr[i])
        end
      end
    end
    accumulator
  end

end

liste = [1, 2, 3, 4 ,5,6,7, 3]

puts liste.my_map{|x| x+1}