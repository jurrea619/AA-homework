=begin
    Octupus problems set regarding Big-O analysis
=end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# 'Sluggish Octupus' uses loops to search; n^2 runtime
def sluggish(arr)
    arr.each_with_index do |str, i|
        longest = true
        arr.each_with_index do |str2, j|
            next if i == j
            longest = false if str2.length > str.length
        end
        return str if longest
    end
end

puts "Sluggish: #{sluggish(fish)}"

# 'Dominant Octupus' uses merge sort method; n log n runtime
class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def dominant(arr)
# sort the array longest to shortest
  prc = Proc.new { |x, y| y.length <=> x.length }
  #return the first element
  arr.merge_sort(&prc)[0]
end

puts "Dominant: #{dominant(fish)}"

# 'Clever Octupus' holds longest while is iterates through list once; linear n runtime
def clever(arr)
    longest = ""
    arr.each_with_index do |el, idx|
        longest = el if el.length > longest.length
    end
    longest
end

puts "Clever: #{clever(fish)}"

# Dancing Octupus search questions

tiles_arr = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# 'Slow Dance' searches through arr until direction is found; linear O(n) runtime
def slow_dance(direction, arr)
    arr.each_with_index do |tile, idx|
        return idx if tile == direction
    end
end

puts "Slow dance (\"up\"): #{slow_dance("up", tiles_arr)}"

# 'Constant Dance' utilizes hash for quick lookup; constant O(1) runtime
tiles_hash = {
    "up" => 0,
    "right-up" => 1, 
    "right" => 2, 
    "right-down" => 3, 
    "down" => 4, 
    "left-down" => 5, 
    "left" => 6,  
    "left-up" => 7 
}

def constant_dance(direction, hash)
    hash[direction]
end

puts "Constant dance (\"right\"): #{constant_dance("right", tiles_hash)}"