# Definition for singly-linked list.
# class ListNode
#     attr_accessor :next,:data
#     def initialize(data)
#         @data = data
#         @next=nil
#     end
# end

class Solution
    # @param a : head node of linked list
    # @return the head node in the linked list
    def subtract(a)
        head = a
        single_speed = a
        double_speed = a.next
        while double_speed != nil && double_speed.next != nil
            single_speed = single_speed.next
            double_speed = double_speed.next.next
        end
        second_half_reversed = reverse_list(single_speed.next)
        single_speed.next = nil
        # puts "reversed second_half"
        # print_list(second_half_reversed)
        first_half = head
        second_half = second_half_reversed
        while first_half != nil && second_half != nil
            first_half.data = second_half.data - first_half.data
            first_half = first_half.next
            second_half = second_half.next
        end
        second_half_corrected = reverse_list(second_half_reversed)
        # puts "second_half_corrected"
        # print_list(second_half_corrected)
        head_ref = head
        while head_ref.next != nil
            head_ref = head_ref.next
        end
        head_ref.next = second_half_corrected
        head
    end

    def reverse_list(head)
        if head.nil?
            return head
        end
        curr = head
        prev = nil
        next_node = curr.next
        while next_node != nil
            next_next = next_node.next
            curr.next = prev
            next_node.next = curr
            prev = curr
            curr = next_node
            next_node = next_next
        end
        curr
    end
end
