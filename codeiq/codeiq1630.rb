input = gets("\t\n").chomp.split.map &:to_i

input.each { |e|
    count = 0
    pow = 1
    mod_stack = [0]
    loop { 
        mod = e % 10
        e = e /10
        count += (e + (mod > 7 ? 1 : 0 )) * pow 
        if mod == 7
            tmp_pow = pow / 10
            mod_stack.each { |e|  
                count += (e * tmp_pow)
                tmp_pow /= 10
            }
            count += 1
        end

        pow = pow * 10
        mod_stack.unshift(mod)
        break if e < 1
    }
    p count
}