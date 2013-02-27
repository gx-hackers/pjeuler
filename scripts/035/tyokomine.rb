# encoding:utf-8
#
# 197$B$O=d2sAG?t$H8F$P$l$k(B. $B7e$r2sE>$5$;$?$H$-$KF@$i$l$k?t(B 197, 971, 719 $B$,A4$FAG?t$@$+$i$G$"$k(B.
#
# 100$BL$K~$K$O=d2sAG?t$,(B13$B8D$"$k(B: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, $B$*$h$S(B97$B$G$"$k(B.
#
# 100$BK|L$K~$N=d2sAG?t$O$$$/$D$"$k$+(B?
require 'prime'

def is_prime_rotaion(n)
  n_to_s = n.to_s
  return false if (n >= 10 && n_to_s.index("2") || n_to_s.index("4") || n_to_s.index("6") || n_to_s.index("8") || n_to_s.index("0"))
  
  n_length = n_to_s.size
  str = n_to_s + n_to_s
  for i in 0..n_length-1
    return false if !str[i..n_length+i-1].to_i.prime?
  end
  return true
end

n=0
ans = 3 #2,3,5
loop do
  n+=1
  prime = 6*n+1
  break if prime > 1_000_000
  if prime.prime?
    ans += 1 if is_prime_rotaion(prime)
  end
  prime += 4
  break if prime > 1_000_000
 
  if prime.prime?
    ans += 1 if is_prime_rotaion(prime)
  end
end
p ans


