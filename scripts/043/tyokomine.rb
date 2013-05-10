# coding : utf-8
# $B?t(B1406357289$B$O(B0$B$+$i(B9$B$N(BPandigital$B?t$G$"$k(B (0$B$+$i(B9$B$,(B1$BEY$:$D8=$l$k$N$G(B). $B$3$N?t$OItJ,Ns$,LLGr$$@-<A$r;}$C$F$$$k(B.
#
# d1$B$r(B1$B7eL\(B, d2$B$r(B2$B7eL\$N?t$H$7(B, $B0J2<=g$K(Bdn$B$rDj5A$9$k(B. $B$3$N5-K!$rMQ$$$k$H<!$N$3$H$,J,$+$k(B.
#
# d2d3d4=406$B$O(B2$B$G3d$j@Z$l$k(B
# d3d4d5=063$B$O(B3$B$G3d$j@Z$l$k(B
# d4d5d6=635$B$O(B5$B$G3d$j@Z$l$k(B
# d5d6d7=357$B$O(B7$B$G3d$j@Z$l$k(B
# d6d7d8=572$B$O(B11$B$G3d$j@Z$l$k(B
# d7d8d9=728$B$O(B13$B$G3d$j@Z$l$k(B
# d8d9d10=289$B$O(B17$B$G3d$j@Z$l$k(B
# $B$3$N$h$&$J@-<A$r$b$D(B0$B$+$i(B9$B$N(BPandigital$B?t$NAmOB$r5a$a$h(B.
result = 0
nums = (0..9).to_a
nums.permutation(10){|n|
  next if (n[7].to_s+n[8].to_s+n[9].to_s).to_f % 17 != 0
  next if (n[6].to_s+n[7].to_s+n[8].to_s).to_f % 13 != 0
  next if (n[5].to_s+n[6].to_s+n[7].to_s).to_f % 11 != 0
  next if (n[4].to_s+n[5].to_s+n[6].to_s).to_f % 7 != 0
  next if (n[3].to_s+n[4].to_s+n[5].to_s).to_f % 5 != 0
  next if (n[2].to_s+n[3].to_s+n[4].to_s).to_f % 3 != 0
  next if (n[1].to_s+n[2].to_s+n[3].to_s).to_f % 2 != 0
  result += n.join().to_i
}
p result
