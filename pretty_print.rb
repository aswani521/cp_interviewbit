class Solution
    # @param a : integer
    # @return an array of array of integers
    def prettyPrint(a)
        concentric_matrix(a)
    end
    def concentric_matrix(n)
  matrix_size = ((2 * n) - 1)
  result_matrix = Array.new(matrix_size, 0)
  (0...matrix_size).each do |idx|
    result_matrix[idx] = Array.new(matrix_size, 0)
  end
  loop_value = n
  start_x = start_y = 0
  while loop_value > 0

    if loop_value == 1
      result_matrix[start_x][start_y] = 1
      break
    end

    inner_matrix_length = ((2 * loop_value) - 1)
    idx = 0
    while idx < inner_matrix_length
      # 0,0 ==> 0,2
      result_matrix[start_x][start_y + idx] = loop_value
      # 2,0 ==> 2,2
      result_matrix[start_x + inner_matrix_length - 1][start_y + idx] = loop_value
      idx += 1
    end

    idx = 0
    while idx < inner_matrix_length
      # 0,0 ==> 2,0
      result_matrix[start_x + idx][start_y] = loop_value
      # 0,2 ==> 2,2
      result_matrix[start_x + idx][start_y + inner_matrix_length - 1] = loop_value
      idx += 1
    end
    start_x += 1
    start_y += 1
    loop_value -= 1
  end
  result_matrix
end
end
