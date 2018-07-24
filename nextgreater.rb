class Solution
    # @param a : array of integers
    # @return an array of integers
    def nextGreater(a)
        return nil if a.nil?
        length = a.length
        result = Array.new(length, -1)
        idx = 0
        while idx < length
            curr_val = a[idx]
            idx_2 = idx + 1
            while idx_2 < length
                if a[idx_2] > a[idx]
                    result[idx] = a[idx_2]
                    break
                end
                idx_2 += 1
            end
            idx += 1
        end
        result

    end
end
