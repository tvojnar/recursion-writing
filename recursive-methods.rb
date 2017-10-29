# Authoring recursive algorithms. Add comments including time and space complexity for each method.

# NOTE: The time complexity of the factorial method is O(n), where n is the value of the interger passed in as a parameter, because there will be n recursive function calls before an output can be calculated.
# NOTE: The space complexity is also O(n) because there will be n stackframes before an output can be calculated. The space complexity of the method itself (not including the stack frames) is O(1) because only memory for the return value of the function is allocated (QUESTION: is there any memory allocated for the return value??)
def factorial(n)
  if n == 0
    return 1
  end
  return n * factorial(n-1)
end

# NOTE: The time complexity is O(n) where n is the length of the string. This is because there will be n recursive function calls before the reversed string can be returned.
# NOTE: The space complexity is O(n) where n is the length of the string. This is because n stack frames will be created and memory needs to be allocated for a string of length n.
def reverse(s)
  # create the string variable so we don't modify the string passed in as a parameter
  string = s
  if string.length < 2
    return s
  end

  last_el = string[-1]
  others = string[0...-1]
  others = reverse(others)
  return last_el + others
end # reverse

 # NOTE: The time complexity is O(n) where n is the length of the string. This is because there will be n recursive function calls before the reversed string can be returned.
 # NOTE: The space complexity id O(n) there will be n recursive function calls which will result in stack frames that use memory in the stack. This method also
 def reverse_inplace(s)
  # This is a wrapper method
  return reverse_inplace_2(s, 0, s.length - 1)
end

 def reverse_inplace_2(s, i , j)

   if s.length < 2
     return s
   end

   if j <= i
     return s
   end

   temp = s[i]
   s[i] = s[j]
   s[j] = temp

   return reverse_inplace_2(s, i + 1, j - 1)

 end # reverse_inplace

# NOTE: The time complexity is O(n), where n is the integer value of the input parameter. This is because there will be n recursive runction calls before the output can be returned.
# NOTE: The space complexity is also O(n) because there will be n stack frames.
def bunny(n)
  if n === 0
    return 0
  end

  return 2 + bunny(n-1)
end

# NOTE: The time complexity is O(n/2) or O(n) because there will be n/2 recursive calls, where n is the length of s.
# NOTE: the space complexity is O(n) as well because there will be n/2 stack frames created.
def nested(s)
  # this is a wrapper method
  return nested_2(s, 0, (s.length - 1) )
end

def nested_2(s, i, j)
  if s.length % 2 != 0 || s.length < 2
    return false
  end

  if j <= i
    return true
  end

  if s[i] == s[j]
    return false
  end

  nested_2(s, i + 1, j - 1)
  return true
end # nested


def search(array, value)
  search_2(array, value, 0)
end # search

def search_2(array, value, i)
  len = array.length
  if len < 1
    return false
  end

  if i >= len
    return false
  end

  if array[i] == value
    return true
  end

  search_2(array, value, i + 1)
end

def is_palindrome(s)
  puts "Not implemented."
end

def digit_match(n, m)
  puts "Not implemented."
end

# Factorial Tests
raise "factorial broke - factorial(4)" unless factorial(4) == 24
raise "factorial broke - factorial(0)" unless factorial(0) == 1
puts "passes all factorial tests"

# Reverse Tests
raise "reverse broke - reverse('hello world')" unless reverse("hello world") == "dlrow olleh"
raise "reverse broke - reverse('a b c')" unless reverse("a b c") == "c b a"
puts "passes all reverse tests"

# Reverse In place Tests
str_1 = 'hello world'
reverse_inplace(str_1)
raise "reverse broke - reverse_inplace('hello world')" unless str_1 == "dlrow olleh"
str_2 = 'a b c'
reverse_inplace(str_2)
raise "reverse broke - reverse_inplace('a b c')" unless str_2 == "c b a"
puts "passes all reverse_inplace tests"

# Bunny Tests
raise "bunny broke - bunny(0)" unless bunny(0) == 0
raise "bunny broke - bunny(10)" unless bunny(10) == 20
puts "passes all bunny tests"

# Nested Tests
raise "nested broke - nested('((()))')" unless nested("((()))") == true
raise "nested broke - nested('())')" unless nested("())") == false
puts "passes all nested tests"

# Search Tests
arr_1 = [34, 45, 21, 4, 67]
raise "search broke - search([34, 45, 21, 4, 67], 4)" unless search(arr_1, 4) == true
arr_2 = [24, 51, 11]
raise "search broke - search([24, 51, 11], 4)" unless search(arr_2, 4) == false
arr_3 = []
raise "search broke - search([], 4)" unless search(arr_3, 4) == false
puts "passes all search tests"

# Palindrome Tests
raise "is_palindrome broke - is_palindrome('racecar')" unless is_palindrome('racecar') == true
raise "is_palindrome broke - is_palindrome('smile')" unless is_palindrome('smile') == false
puts "passes all palindrome tests"

# Digit Match Tests
raise "digit_match broke - digit_match(1072503891, 62530841)" unless digit_match(1072503891, 62530841) == 4
raise "digit_match broke - digit_match(1234, 4321)" unless digit_match(1234, 4321) == 0
raise "digit_match broke - digit_match(3862947593, 3862947593)" unless digit_match(3862947593, 3862947593) == 10
puts "passes all digit_match tests"
puts "All test passed"
