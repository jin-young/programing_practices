def all_subsets_an_print(arr, track = [])
  if arr.empty?
    puts "(#{track.map { |v| v.nil? ? '*' : v }.join(',')})"
    return
  end

  # select first element of the array
  all_subsets_an_print(arr[1..-1], track + [arr.first])

  all_subsets_an_print(arr[1..-1], track + [nil])
end

puts all_subsets_an_print(['a','b','c'])