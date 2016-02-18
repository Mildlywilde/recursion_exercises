def append(ary, n)
	return ary if n < 0
	ary << n
	append(ary, n-1)
end

def reverse_append(ary, n)
	return ary if n < 0
	reverse_append(ary, n-1)
	ary << n
end

def factorial(n)
	return 1 if n <= 1
	n * factorial(n-1)
end

def palindrome?(str)
	str.gsub!(/\s/, "")
	return true if str.length <= 1
	if str[0] == str[-1]
		palindrome?(str[1..-2])
	else return false
	end
end

def bottles_o_beer(n)
	if n <= 0
		puts "no more bottles of beer on the wall" if n <= 0
	else
		puts "#{n} bottles of beer on the wall"
		bottles_o_beer(n-1)
	end
end

def fibonacci(n)
	if n <= 0
		return 0
	elsif n == 1
		return 1
	else 
		return fibonacci(n-1) + fibonacci(n-2)
	end
end

def flatten(ary, out = [])
	ary.each do |obj|
		if obj.kind_of?(Array)
			flatten(obj, out)
		else
			out << obj
		end
	end
	out
end

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def to_numeral(roman_mapping, num, result = "")
	return result if num == 0
	roman_mapping.keys.each do |divisor|
		quotient, modulus = num.divmod(divisor)
		result << roman_mapping[divisor] * quotient
		return to_numeral(roman_mapping, modulus, result) if quotient > 0
	end
end

roman_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def roman_to_integer(roman_mapping, str, result = 0)
  return result if str.empty?
  roman_mapping.keys.each do |roman|
    if str.start_with?(roman)
      result += roman_mapping[roman]
      str = str.slice(roman.length, str.length)
      return roman_to_integer(roman_mapping, str, result)
    end
  end
end

puts roman_to_integer(roman_mapping, "XII")