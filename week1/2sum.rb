require 'byebug'
  def sum2(input, target_sum)
    val_hash = {}
    low = high = nil
    input.each_with_index{ |val, idx|
      if val_hash[target_sum - val] != nil
        local_lo = val_hash[target_sum - val].first
        local_hi = idx
        if low.nil? && high.nil?
          low = local_lo
          high = local_hi
          # puts "#{low}, #{high}, idx: #{idx}"
        elsif local_hi == high
          low = low > local_lo ? local_lo : low
        elsif local_hi < high
          low = local_lo
          high = local_hi
        end
      end
      val_hash[val] = val_hash[val] || []
      val_hash[val].push(idx)
    }
    return [low+1, high+1] if low != nil && high != nil
    []
  end

# puts sum2([2, 7, 11, 15], 9)
puts sum2([ 1, 1, 1 ],2)