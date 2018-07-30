# Definition for singly-linked list.
# class ListNode
#     attr_accessor :next,:data
#     def initialize(data)
#         @data = data
#         @next=nil
#     end
# end

def get_digit(node)
  digit = 0
  digit = node.data if node != nil
  digit
end

def add_2_numbers(a,b)
  return a || b if a.nil? || b.nil?
  iter1 = a
  iter2 = b
  carry = 0
  result_head = nil
  result_head_iter = nil
  trailing_zero_count = 0
  while iter1 != nil || iter2 != nil
    digit1 = get_digit(iter1)
    digit2 = get_digit(iter2)
    result = digit1 + digit2 + carry
    if result == 0
      trailing_zero_count += 1
    else
      trailing_zero_count = 0
    end
    digit = result % 10
    carry = result/10

    new_node = ListNode.new(digit)
    if result_head_iter == nil
      result_head = new_node
      result_head_iter = new_node
    else
      result_head_iter.next = new_node
      result_head_iter = result_head_iter.next
    end
    iter1 = iter1.next if iter1 != nil
    iter2 = iter2.next if iter2 != nil
  end

  if carry != 0
    new_node = ListNode.new(carry)
    result_head_iter.next = new_node
    trailing_zero_count = 0
  end

  if trailing_zero_count > 0
    trail_iter1 = result_head
    trail_iter2 = result_head
    while trailing_zero_count > 0
      trail_iter1 = trail_iter1.next
      trailing_zero_count -= 1
    end
    while trail_iter1 != nil
      trail_iter1 = trail_iter1.next
      trail_iter2 = trail_iter2.next
    end
    trail_iter2.next = nil
  end

  result_head
end