def mod(x,y)
	return x % y
end

def sumsq(*args)
	args.reduce { |sum, i| sum += i ** 2 }
end

input = gets.chomp
input.gsub!("two", "2")
tmp = input.gsub(/mod|sumsq/, "")

if tmp.match(/[a-zA-Z]/)
	puts "Unknown name"
	exit
end

begin
	puts eval(input)
rescue NoMethodError => nme
	puts "Unknown name"
rescue SyntaxError => se
	puts "Unknown syntax"
end
