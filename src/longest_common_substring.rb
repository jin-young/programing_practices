def max(a,b)
  a > b ? a : b
end

def longest_common_substring(arr1, arr2, map)
  max_length = 0
  answer = nil
  1.upto(arr1.length-1) do |row|
    1.upto(arr2.length-1) do |col|
      if arr1[row-1] != arr2[col-1]
        map[row][col] = 0
      else
        map[row][col] = map[row-1][col-1] + 1
        if map[row][col] > max_length
          max_length = map[row][col]
          answer = [row, col]
        end
      end
    end
  end
  map[answer[0]][answer[1]]
end

def get_map(row, col)
  map = []
  row.times do |r|
    row_arr = []
    col.times do |c|
      if r == 0 || c == 0
        row_arr << 0
      else
        row_arr << nil
      end
    end
    map << row_arr
  end
  map
end

#arr1 = 'ABABC'.split('')
#arr2 = 'BABCA'.split('')
#map = get_map(arr1.length, arr2.length)

#puts longest_common_substring(arr1, arr2, map)

arr1 = 'FourscoreandsevenyearsagoourfaathersbroughtforthonthiscontainentanewnationconceivedinzLibertyanddedicatedtothepropositionthatallmenarecreatedequalNowweareengagedinagreahtcivilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth'.split('')
arr2 = arr1.reverse
map = get_map(arr1.length, arr2.length)
puts longest_common_substring(arr1, arr2, map)