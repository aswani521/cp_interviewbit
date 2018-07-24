class Solution
    def num_range(input,lower,upper)
  count = 0
  idx1 = 0
  return count if input.nil? || lower.nil? || upper.nil? || input.empty?
  while idx1 < input.length
    sum = 0
    idx2 = idx1
    while idx2 < input.length
      sum += input[idx2]
      if sum >= lower && sum <= upper
        count += 1
      end
      if sum > upper
        break
      end
      idx2 += 1
    end
    idx1 += 1
  end
  count
end

    # @param a : array of integers
    # @param b : integer
    # @param c : integer
    # @return an integer
    def numRange(a, b, c)
        num_range(a,b,c)
    end

end
