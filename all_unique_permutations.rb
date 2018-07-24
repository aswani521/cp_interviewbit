require 'set'
class Solution

# def do_permute(input_numbers, offset_numbers, permutations)
#     if input_numbers.length == 0 or input_numbers.nil?
#         permutations.add(offset_numbers)
#         return
#     end
#     i = 0
#     while i < input_numbers.length
#         do_permute(input_numbers[0...i]+input_numbers[i+1..input_numbers.length], offset_numbers+[input_numbers[i]], permutations )
#         i = i + 1
#     end
#     permutations.to_a
# end
def can_be_swapped(input, index, iter)
  i = index
  while i < iter
    return false if input[i] == input[iter]
    i += 1
  end
  # puts "here"
  return true
end

def uniq_permute(input, index, result_set)
  if index >= input.length
    temp = input[0]
    temp_arr = [temp] + input[1...input.length]
    result_set.add(temp_arr)
    # puts "add into results #{input}, #{result_set.inspect}"
    return
  end
  iter = index
  while iter < input.length
    if can_be_swapped(input, index, iter)
      # puts "before swap #{input}, #{index}, #{iter}"
      temp = input[index]
      input[index] = input[iter]
      input[iter] = temp
      # puts "after swap #{input}"
      uniq_permute(input, index + 1, result_set)
      temp = input[index]
      input[index] = input[iter]
      input[iter] = temp
    end
    iter += 1
  end
  result_set.to_a
end

    # @param a : array of integers
    # @return an array of array of integers
    def permute(a)
        # do_permute(a,[],Set.new())
        uniq_permute(a, 0, Set.new())
    end
end
