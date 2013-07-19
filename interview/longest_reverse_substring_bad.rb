# this could be longest substring problem between string and its' reverse

source = 'FourscoreandsevenyearsagoourfaathersbroughtforthonthiscontainentanewnationconceivedinzLibertyanddedicatedtothepropositionthatallmenarecreatedequalNowweareengagedinagreahtcivilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth'

def longer(a1, a2)
  a1.length > a2.length ? a1 : a2
end

@cache = {}

def lcs(arr1, arr2, idx1, idx2, lcs_candidate=[])
  return lcs_candidate if idx1 == 0 or idx2 == 0

  if @cache[[idx1,idx2]]
    return @cache[[idx1, idx2]]
  end

  longest = nil
  if arr1[idx1] == arr2[idx2]
    @cache[[idx1, idx2]] = lcs(arr1, arr2, idx1-1, idx2-1, [arr1[idx1]] + lcs_candidate)
  else
    lcs_candi1 = lcs(arr1, arr2, idx1-1, idx2)
    lcs_candi2 = lcs(arr1, arr2, idx1, idx2-1)

    @cache[[idx1, idx2]] = longer(lcs_candidate, longer(lcs_candi1, lcs_candi2))
  end
end

arr1=source.split('')
arr2=arr1.reverse

puts lcs(arr1, arr2, arr1.length-1, arr2.length-1).join('')