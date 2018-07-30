
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :next,:data
#     def initialize(data)
#         @data = data
#         @next=nil
#     end
# end
def partition_list(list, target)
  return list if list.nil?
  list_less_than = list_gte = nil
  list_gte_head = list_lt_head = nil
  list_iter = list
  while list_iter != nil
    if list_iter.data < target
      if list_less_than == nil
        list_less_than = list_iter
        list_lt_head = list_iter
      else
        list_less_than.next = list_iter
        list_less_than = list_less_than.next
      end
    else
      if list_gte == nil
        list_gte = list_iter
        list_gte_head = list_iter
      else
        list_gte.next = list_iter
        list_gte = list_gte.next
      end
    end
    list_iter = list_iter.next
  end
  return list if list_less_than.nil? || list_gte.nil?
  list_less_than.next = list_gte_head if list_less_than != nil
  list_gte.next = nil if list_gte != nil
  list_lt_head

end