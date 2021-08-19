# PHASE 2
FRUITS = ["apple", "banana", "orange"]

class NotAFruitError < StandardError
  def message
    "I dont recognize that fruit"
  end
end

class CoffeeError < StandardError
  def message
    "Yum, I looooooove coffee"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!\n" 
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise NotAFruitError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue NotAFruitError => e
    puts e.message
  rescue CoffeeError => e
    puts e.message
    retry
  end
end  

# PHASE 3
class YoungFriendshipError < StandardError
  def message
    "The friendship needs to be 5 years old to be reach \'best friends\' level"
  end
end

class NoPastTimeError < StandardError
  def message
    'You and your best friend MUST have a favorite pastime'
  end
end

class NoNameError < StandardError
  def message
    'I find it hard to believe your best friend has no name'
  end
end
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise YoungFriendshipError if yrs_known < 5
    raise NoNameError if name.empty?
    raise NoPastTimeError if fav_pastime.empty?
    @name = name
    @yrs_known = yrs_known.to_i
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


