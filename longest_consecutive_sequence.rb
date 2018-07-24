class Solution
    # @param a : constant array of integers
    # @return an integer
    def longestConsecutive(a)
          global_longest = 0
  return global_longest if a.nil? || a.empty?
  values = {}
  a.each do |num|
    values[num] = 1
  end
  a.each do |num|
    next unless values[num-1].nil?
    local_max = 0
    while values[num] != nil
      local_max += 1
      num += 1
    end
    if local_max > global_longest
      global_longest = local_max
    end
  end
  global_longest

    end
end
