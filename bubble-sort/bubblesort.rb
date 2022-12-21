#implementing a bubble sort

SORT_ARRAY = [5, 3, 1, 6, 7, 2, 4, 8]
SORT_ARRAY_2 = [100, 13, 12, -13, 159, 131, 0, 215, -16]

def bubble_sort(array)
    # k is to control how long the while loop runs, with subsequent optimisation, each loop will be shorter
    k = array.length
    while k > 0
        array.each_index do |i|
            # optimisation by breaking loop early
            if i > k
                next
            end 
            if i < array.length - 1 && array[i] > array[i + 1]
                temp = array[i]
                array[i] = array[i + 1]
                array[i + 1] = temp
            end
        end
        k -= 1
    end
    return array
end

p(bubble_sort(SORT_ARRAY))
p(bubble_sort(SORT_ARRAY_2))