# 先頭の桁を決める。
# 9! = 362880
# なので、先頭は2の時となる
rest = 1_000_000 - ( 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1 ) * 2

p ([0,1,3,4,5,6,7,8,9].permutation(9).map{|a| 2.to_s + a.join('')}.sort)[rest -1]
