# Force the value of the seed so the results are repeatable

SEED = Time.now.to_i

def pick_K_random_item_uniformly_distributed(arr, sample_count)
  prng = Random.new(SEED)
  sample_titles = []
  arr.each_with_index do |line, idx|
    if idx < sample_count
      sample_titles << line
    else
      r = prng.rand(0..idx)
      if r < sample_count
        sample_titles[r] = line
      end
    end
  end
  sample_titles
end

def pick_one_random_item_uniformly_distributed(arr)
  it = nil
  prng = Random.new(SEED)
  arr.each_with_index do |line, idx|
    if prng.rand(0..idx) == 0
      it = line
    end
  end
  it
end

arr = %W{ARGF ArgumentError Array BasicObject Bignum Binding Class Comparable Complex Continuation Data Dir ENV EOFError}

puts pick_K_random_item_uniformly_distributed(arr, 5).join(', ')
puts pick_one_random_item_uniformly_distributed(arr)