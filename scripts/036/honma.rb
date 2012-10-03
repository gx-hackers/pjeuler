#!/usr/bin/env ruby
# encoding : utf-8
# Problem 36  †
# 585 = 10010010012 (2進) は10進でも2進でも回文数である.
# 100万未満で10進でも2進でも回文数になるような数の総和を求めよ.
# (注: 先頭に0を含めて回文にすることは許されない.)
# t = Time.now
p (1..999_999).select{|n| n == n.to_s.reverse.to_i and n.to_s(2) == n.to_s(2).reverse }.inject(:+)
# sum = 0
# not_exits_num = []
# (1..999_999).each{|n|
#   # sum += n if n == n.to_s.reverse.to_i and n.to_s(2) == n.to_s(2).reverse # 1.40
#   # n.to_s == n.to_s.reverse and n.to_s(2) == n.to_s(2).reverse # 1.40
#   # n.to_s(2) == n.to_s(2).reverse and n.to_s == n.to_s.reverse # 2.45
#   if n == n.to_s.reverse.to_i
#     binary = n.to_s(2)
#     sum += n if binary == binary.reverse # 1.30
#   end
# }
# p sum # 1.2
# sum = 0
# def check(n)
#   bin = n.to_s(2)
#   if bin == bin.reverse
#     sum += n
#   end
# end
#
# (1 .. 9).each do |n|
#   check(n)
# end
# (1 .. 999).each do |n|
#   # 偶数桁
#   check( (n.to_s + n.to_s.reverse).to_i )
#   # 奇数桁
#   next if n > 99
#   (0..9).each do |m|
#     check( (n.to_s + m.to_s + n.to_s.reverse).to_i )
#   end
# end
# p sum
# p Time.now - t
