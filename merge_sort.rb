def merge_sort(ary, output = [])

	if ary.length > 1

		a = ary[0..(ary.length/2)-1]
		b = ary[ary.length/2..ary.length]

		a = merge_sort(a)
		b = merge_sort(b)

		(a.length + b.length).times do |n|
			if a[0] == nil
				output << b[0]
				b.shift
			elsif b[0] == nil
				output << a[0]
				a.shift
			elsif a[0] <= b[0]
				output << a[0]
				a.shift
			else
				output << b[0]
				b.shift
			end
		end
	else
		output = ary
	end
	output
end

puts merge_sort([3,2,3,9,568,43,56,7])