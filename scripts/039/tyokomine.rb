#$BJU$ND9$5$,(B{a,b,c}$B$H@0?t$N(B3$B$DAH$G$"$kD>3Q;03Q7A$r9M$((B, $B$=$N<~0O$ND9$5$r(Bp$B$H$9$k(B. p = 120$B$N$H$-$K$O(B3$B$D$N2r$,B8:_$9$k(B:
#
#{20,48,52}, {24,45,51}, {30,40,50}
#p $B!e(B 1000 $B$G2r$N?t$,:GBg$K$J$k(B p $B$r5a$a$h(B.

ans = Array.new
for a in 1..334
  for b in a+1..600
     c = Math.hypot(a,b)
     break if a+b+c>1000
     p_num = a+b+c
     #c$B$,@0?t$N$H$-$OD>3Q(B
     if c == c.to_i
       if ans[p_num] == nil
         ans[p_num] = 1
       else
         ans[p_num] = ans[p_num]+1
       end
     end
  end
end
max=0
result = 0
#$BG[Ns%P!<%8%g%s(B
ans.each_with_index do |e,i|
 if e != nil
  if max < e
   max = e
   result = i
  end
 end
end
#$B%O%C%7%e%P!<%8%g%s(B
#ans.each{|key,value|
#  if max < value
#    max = value
#    result = key
#  end
#}
p result
