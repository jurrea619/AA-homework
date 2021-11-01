=begin
    Octupus problems set regarding Big-O analysis
=end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# 'Sluggish Octupus' with quadratic n^2 runtime
def sluggish(arr)
    arr.each_with_index do |str, i|
        longest = true
        arr.each_with_index do |str2, j|
            next if i == j
            longest = false if str2.length > str.length
        end
        return [str, i] if longest
    end
end

p sluggish(fish)

