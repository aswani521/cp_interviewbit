=begin
Anagrams
Given an array of strings, return all groups of strings that are anagrams. Represent a group by a list of integers representing the index in the original list. Look at the sample case for clarification.

 Anagram : a word, phrase, or name formed by rearranging the letters of another, such as 'spar', formed from 'rasp'
 Note: All inputs will be in lower-case.
=end
def anagrams(input_str)
  hash_values = {}
  input_str.each_with_index{ |str, idx|
    hash_key = str.chars.sort.join
    hash_values[hash_key] = hash_values[hash_key] || []
    hash_values[hash_key].push(idx+1)
  }
  hash_values.values
end

puts "#{anagrams(["cat", "dog", "god", "tca"])}"