=begin
The wave (known as the Mexican wave in the English-speaking world outside North America) is an example of metachronal rhythm achieved in a packed stadium when successive groups of spectators briefly stand, yell, and raise their arms. Immediately upon stretching to full height, the spectator returns to the usual seated position.

The result is a wave of standing spectators that travels through the crowd, even though individual spectators never move away from their seats. In many large arenas the crowd is seated in a contiguous circuit all the way around the sport field, and so the wave is able to travel continuously around the arena; in discontiguous seating arrangements, the wave can instead reflect back and forth through the crowd. When the gap in seating is narrow, the wave can sometimes pass through it. Usually only one wave crest will be present at any given time in an arena, although simultaneous, counter-rotating waves have been produced. (Source Wikipedia)
 
Task
  	In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
Rules
1.  The input string will always be lower case but maybe empty.
2.  If the character in the string is whitespace then pass over it as if it was an empty seat.
Example

wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

Problem: Given a String, return an array that contains the strings as though one letter of each string is doing the "mexican wave"

Rules: 
- If whitespace don't do anything
- string will always be lower case or empty

Algo: 
- If str is empty, return empty array
- initialize result = []
- Use Integer#times to get every character of the string by index
- On each Iteration
  - str[index].upcase!
  - result << str

return result
=end

def wave(str)
  result = []

  str.size.times do |index|
    if str[index] != ' '
      result << str[0...index] + str[index].upcase + str[index+1...str.size]
    end
  end

  result
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

def wave(str)
  result = []

  str.size.times do |index|
    arr = str.chars
    arr[index].upcase!
    result << arr.join
  end

  result
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

def wave(str)
  result = []
  temp = str.clone

  str.size.times do |index|
    temp[index] = temp[index].upcase
    result << temp
    temp = str.clone
  end

  p result
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

def wave(str)
  result = []
  chars = str.downcase.chars
  chars.each_with_index do |char, idx|
    next if char == " "
    result << str[0...idx] + char.upcase + str[idx+1..-1]
  end
  result
end

=begin
- rookie mistake. Cannot do this: 
- On each Iteration
- str[index].upcase!
- result << str
=end