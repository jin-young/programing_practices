# this could be longest substring problem between string and its' reverse

source = 'FourscoreandsevenyearsagoourfaathersbroughtforthonthiscontainentanewnationconceivedinzLibertyanddedicatedtothepropositionthatallmenarecreatedequalNowweareengagedinagreahtcivilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth'

def max(a, b)
  a > b ? a : b
end

def def_map(length)
  m = []
  length.times {
    r = []
    length.times { r << 0 }
    m << r
  }
  m
end

def prev_val(map, r_idx, c_idx)
  return 0 if r_idx == 0 or c_idx == map.length

  map[r_idx][c_idx]GTCGTTCGGAATGCCGTTGCTCTGTAAA
end

def lcs(arr1)
  map = def_map(arr1.length)
  max_length = 0
  answer = nil
  0.upto(arr1.length-1) do |r_idx|
    (arr1.length-1).downto(0) do |c_idx|
      if arr1[r_idx] == arr1[c_idx]
        map[r_idx][c_idx] = 1 + prev_val(map, r_idx-1, c_idx+1)
        if map[r_idx][c_idx] > max_length
          max_length = map[r_idx][c_idx]
          answer = [r_idx, c_idx]
        end
      else
        map[r_idx][c_idx] = 0
      end
    end
  end
  [*0...max_length].inject('') { |result, idx| arr1[answer[0]-idx] + result }
end

puts lcs(source.split(''))
