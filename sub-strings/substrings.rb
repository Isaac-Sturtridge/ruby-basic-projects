#implementing a substrings method

EXAMPLE_DICTIONARY = ["all", "bee", "black", "yellow", "fat", "ground", "off", "can", "below", "laws", "aviation"]

def substrings(string, dictionary)
    dictionary_counts = Hash.new(0)
    # because words can be found inside words, strip down to single letters
    letters = string.downcase
    letters = letters.split('')
    temp = ''
    letters.each do|c|
        unless /[[:alpha:]]/.match(c)
            temp = ''
        else 
            temp += c
        end
        if dictionary.include?(temp)
            dictionary_counts[temp] += 1
        end
    end
    return dictionary_counts
end

puts(substrings("According to all known laws of aviation, there is no way a bee should be able to fly.
    Its wings are too small to get its fat little body off the ground.
    The bee, of course, flies anyway because bees don't care what humans think is impossible.
    Yellow, black. Yellow, black. Yellow, black. Yellow, black.
    Ooh, black and yellow!
    Let's shake it up a little.", EXAMPLE_DICTIONARY))