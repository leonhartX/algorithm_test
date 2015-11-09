def convert_to_title(n)
    result = ""
    i = 1
    dict = { 0 => "0"};
    reverse_dict = {"0" => 27}
    ("A".."Z").each { |c|
        dict[i] = c
        reverse_dict[c] = i
        i += 1
    }
    pow = 0
    tmp = n
    while tmp >= 26
        tmp = tmp / 26
        pow += 1
    end
    tmp = n
    while pow >= 0
        p = 26 ** pow
        result << dict[tmp / p]
        # print("now result: #{result}\n")
        tmp = tmp % p
        pow -= 1
    end
    if result.include? "0"
        c = result.chars
        start = false
        (c.length - 1).downto(0) { |i|  
            start = true if c[i] == "0"
            next unless start
            if i > 0
                c[i] = dict[reverse_dict[c[i]] - 1]
                c[i-1] = dict[reverse_dict[c[i-1]] - 1]        
            end
        }
        while c.first == "0"
            c.shift
        end
        result = c.join
    end

    return result
end

puts convert_to_title(gets.to_i)