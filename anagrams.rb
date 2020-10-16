def first_anagram?(str1, str2)
    perms = str1.chars.permutation.to_a
    perms.include?(str2.chars)
end
# O(n!)

def second_anagram?(str1, str2)
    str2 = str2.chars

    str1.each_char do |char|
        i = str2.find_index(char)
        str2[i] = '' if i != nil
    end

    str2.join.length == 0
end
# O(n^2)

def third_anagram?(str1, str2)
    str1.chars.sort == str2.chars.sort
end
# O(nlogn)

def fourth_anagram?(str1, str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    str1.each_char { |char| hash1[char] += 1 }
    str2.each_char { |char| hash2[char] += 1 }
    hash1 == hash2
end
# O(n + n) == O(n)

def fifth_anagram?(str1, str2)
    hash = Hash.new(0)
    str1.each_char { |char| hash[char] += 1 }
    str2.each_char { |char| hash[char] -= 1 }
    hash.each_value.all? { |v| v == 0 }
end
# O(n + n + n) = O(n)

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true