#!/usr/bin/env ruby
# coding : utf-8
# start = Time.now
answer_ary = []
answer_value = 0
sum = 0;
num_list = (1..10).to_a
num_list.permutation(3) {|a, b, c|
  # 最初の要素を出す
  answer_ary << [a, b, c]
  ary = num_list - [a, b, c]
  sum = answer_ary[0].inject(&:+)
  unless [14, 16, 17, 19].include?(sum)
    answer_ary = []
    next
  end
  # 残りの要素を出す
  ary.permutation(2) {|d, e|
    answer_ary << [d, c, e]
    unless sum == answer_ary[1].inject(&:+)
      answer_ary.pop
      next
    end
    ary2 = ary - [d, e]
    ary2.permutation(2) {|f, g|
      answer_ary << [f, e, g]
      unless sum == answer_ary[2].inject(&:+)
        answer_ary.pop
        next
      end
      ary3 = ary2 - [f, g]
      ary3.permutation(2) {|h, i|
        answer_ary << [h, g, i]
        unless sum == answer_ary[3].inject(&:+)
          answer_ary.pop
          next
        end
        ary4 = ary3 - [h, i]
        j = ary4[0]
        answer_ary << [j, i, b]
        unless sum == answer_ary[4].inject(&:+)
          answer_ary.pop(2)
          next
        end
        min_index = 0
        min_value = 11
        answer_ary.each_with_index do |min, i|
          if min[0] < min_value
            min_value = min[0]
            min_index = i
          end
        end
        min_index.times do
          tmp = answer_ary.shift
          answer_ary << tmp
        end
        ans = answer_ary.flatten.join.to_i
        answer_value = ans if answer_ary.flatten.join.length == 16 and answer_value < ans
        answer_ary.pop(2)
      }
      answer_ary.pop
    }
    answer_ary.pop
  }
  answer_ary = []
}
start = Time.now
p answer_value
# p Time.now - start
