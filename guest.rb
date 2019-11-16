class Guest

  attr_reader :name, :wallet, :fav_song, :age, :drunk_level

  def initialize(name, wallet, fav_song, age)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
    @drink = []
    @age = age
    @drunk_level = 0
  end

  def pay_fee(amount)
    @wallet -= amount
  end

  def pay_drink(drink)
    @wallet -= drink.price
  end

  def drink_count
    return @drink.size()
  end

  def add_drink(drink)
    @drink.push(drink)
  end

  def increase_drunk_level(drink)
    @drunk_level += drink.alcohol
  end

  def eat(food)
    @drunk_level -= food.rejuvenation
  end

  def buy_food(food, room)
    eat(food)
    room.bill += food.price
  end


end
