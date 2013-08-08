@cache = {}
def count_possible_paths(curr_x, curr_y, x, y)
  return 1 if curr_x == x and curr_y == y
  return 0 if curr_x > x or curr_y > y

  return @cache[[curr_x, curr_y]] if @cache[[curr_x, curr_y]]

  @cache[[curr_x, curr_y]] = count_possible_paths(curr_x + 1, curr_y, x, y) +
      count_possible_paths(curr_x, curr_y + 1, x, y)
end

puts count_possible_paths(0, 0, 16, 16)

# what about time / space complexity?
# non cache version
# O( (col+row)!/(col!row!) )
# cache version
# O(n)