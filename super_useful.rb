# PHASE 2
def convert_to_int(str)
  begin
  Integer(str)
  rescue ArgumentError => e
    puts "Argument should only contain digits."
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    #puts maybe_fruit
    if maybe_fruit == "coffee"
      raise CoffeeError
    else
      raise StandardError
    end
  end
end

def feed_me_a_fruit
  begin
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
  rescue CoffeeError => e
    #puts e.class
    puts "Only give the monster a fruit"
    retry
  rescue StandardError => e
    #puts e.class
    puts "Only give the monster a fruit."
    return nil
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("Years known is less than 5.") if yrs_known < 5
    raise ArgumentError.new("Name cannot be empty.") if name.nil? or name == ""
    raise ArgumentError.new("You must have a hobby.") if fav_pastime.nil? or fav_pastime == ""
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
