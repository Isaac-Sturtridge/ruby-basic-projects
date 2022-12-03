# implementing a caesar cipher

def caesar_cipher(text, shift_factor)
    ciphered_string = ''
    text.each_char do|c| 
        # caesar cipher should only work on alphabetical characters
        if c.match(/^[[:alpha:]]$/)
            # variable for ASCII code makes the math easier
            new_code = c.ord + shift_factor
            # for uppercase letters going past Z
            if c == c.upcase && new_code > 90
                new_code = new_code - 26
            # for lowercase letters going past Z
            elsif new_code > 122
                new_code = new_code - 26
            end
            # adds the result onto the end
            ciphered_string += new_code.chr
        # result for non-alphabetical characters
       else
            ciphered_string += c
       end
    end
    return ciphered_string
 end

puts caesar_cipher("Veni vidi vici", 5)
puts caesar_cipher("Veni vidi vici", 6)
puts caesar_cipher("Veni vidi vici", 26)
puts caesar_cipher("9 AD, Battle of Teutoburg Forest", 1)
puts caesar_cipher("Varus, give me back my legions", 15)
puts caesar_cipher("", 5)