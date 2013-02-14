#Christian Goldbach$B$OA4$F$N4q9g@.?t$OJ?J}?t$N(B2$BG\$HAG?t$NOB$GI=$;$k$HM=A[$7$?(B.
#
#9 = 7 + 2$B!_(B12
#15 = 7 + 2$B!_(B22
#21 = 3 + 2$B!_(B32
#25 = 7 + 2$B!_(B32
#27 = 19 + 2$B!_(B22
#33 = 31 + 2$B!_(B12
#
#$B8e$K(B, $B$3$NM=A[$O8m$j$G$"$k$3$H$,J,$+$C$?(B.
#
#$BJ?J}?t$N(B2$BG\$HAG?t$NOB$GI=$;$J$$:G>.$N4q9g@.?t$O$$$/$D$+(B?
require 'prime'

def is_true(n)
  max = ((Math::sqrt(n/2).ceil)).to_i+1
  max.downto(1){|i|
    if (n-(i**2)*2).prime?
      return true
    end
  }
  return false
end

n = 1
loop do
  n += 1
  next if n % 2 == 0
  next if n.prime?
  if !is_true(n)
    p n
    break
  end
end

