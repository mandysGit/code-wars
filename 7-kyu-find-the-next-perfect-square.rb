=begin
https://www.codewars.com/kata/56269eb78ad2e4ced1000013
You might know some pretty large perfect squares. But what about the NEXT one?

Complete the findNextSquare method that finds the next integral perfect square after the one passed as a parameter. Recall that an integral perfect square is an integer n such that sqrt(n) is also an integer.

If the parameter is itself not a perfect square, than -1 should be returned. You may assume the parameter is positive.

Examples:

findNextSquare(121) --> returns 144
findNextSquare(625) --> returns 676
findNextSquare(114) --> returns -1 since 114 is not a perfect

Problem:
- Given a number
- Check if it's a perfect square
- If it is a perfect square, find the next perfect square
- If it is not a perfect square return -1

Algo: 
- Use Math.sqrt on input number, to check if it's a perfect square
- If Math.sqrt(input number) MOD 1 != 0 Then return -1

- current_sqrt = Integer.sqrt(input number)
- next_perfect_square = input number
- next_sqrt = Integer.sqrt(next_perfect_square)

- Loop
  - increment next_perfect_square by 1
  - next_sqrt = Integer.sqrt(next_perfect_square)
  - break out of the loop when next_sqrt > current_sqrt

return next_perfect_square
=end

def findNextSquare(sq)
  return -1 if Math.sqrt(sq) % 1 != 0

  current_sqrt = Integer.sqrt(sq)
  next_perfect_square = sq
  next_sqrt = Integer.sqrt(next_perfect_square)

  loop do
    next_perfect_square += 1
    next_sqrt = Integer.sqrt(next_perfect_square)
    break if next_sqrt > current_sqrt
  end

  next_perfect_square
end