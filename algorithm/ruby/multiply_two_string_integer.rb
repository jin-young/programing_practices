def multiply(str1, str2)
  n = max(str1.length, str2.length)
  return str1.to_i * str2.to_i if n == 2

  str1_l = str1[0, str1.length/2]
  str1_r = str1[str1.length/2, str1.length]
  str2_l = str2[0, str2.length/2]
  str2_r = str2[str2.length/2, str2.length]

  a = multiply(str1_l, str2_l)
  b = multiply(str2_l, str2_r)
end