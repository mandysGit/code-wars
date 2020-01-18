=begin
Understand the Problem:
- find the number which has minimum occurences in set and no other number has the same occurence count

Input: n number of Integers
Output: integer, the suspect. Nil, if no suspect is found

Rules:
- Nil is returned when no suspect is found.
- A number which has minimum occurences, there's at least one other number with the same minimum occurrences

Data Structures:
- Splat operator to assign all the Integers as elements of an Array
- Use a Hash to store all the keys as each number, and the value as the occurence

Algorithm:
- Initialize an empty hash as occurences
- Use Splat operator to store all n Integers in an Array, initialize variable as numbers
- Use Array#uniq to remove duplicates, initialize variable as keys
- initialize min_count as 1
- iniitalize min_count_unique? as true

- ITERATE over keys
- occurences[key] = numbers.count(key)

- FIND key with the lowest occurrence
- min_count = occurence.values.min

- FIND if there's another key with the same occurence
- occurence.values.count(min_count) >= 2 then min_count_unique? reassign to false

- Return nil if min_count_unique? is False
- Return occurences.key(min_count)
=end


# return suspect number from given set, return nil if no suspect found
def find_suspect(*numbers)
  occurences = {}
  keys = numbers.uniq
  min_count = 1
  min_count_unique = true

  keys.each { |key| occurences[key] = numbers.count(key) }
  min_count = occurences.values.min

  min_count_unique = false if occurences.values.count(min_count) >= 2

  return nil if min_count_unique == false
  occurences.key(min_count)
end
