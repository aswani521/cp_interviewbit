class Solution

def bin_search(arr, value)
    start = 0
    end_idx = arr.length - 1
    ret_val = nil
    if value > arr[-1]
        return arr.length
    end
    while start < end_idx
        mid = (start + end_idx)/2
        if arr[mid] == value
            return mid
        end
        if arr[mid] > value
            end_idx = mid - 1
        else
            start = mid + 1
        end
    end
    start
end
    # @param a : constant array of integers
    # @param b : integer
    # @return an integer
def kthsmallest(a, b)
  return nil if a.nil? || b.nil?
  k_array = a[0...b].sort
  idx = b
  while idx < a.length
      if a[idx] <= k_array[-1]
          insert_idx = bin_search(k_array, a[idx])
          # puts "insert_idx: #{insert_idx}, a[idx]: #{a[idx]}, k_array: #{k_array}"
          if insert_idx != nil
            if a[idx] > k_array[insert_idx]
              k_array.insert(insert_idx+1, a[idx])
            else
              k_array.insert(insert_idx, a[idx])
            end
          end
          k_array.pop
      end
      idx += 1
  end
  # puts k_array
  k_array[-1]
end
end
