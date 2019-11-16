class BarTab

attr_reader :name

  def initialize(drink)
    @name = name
    @drink = drink
  end

  def stock_count
    @drink.size()
  end

  def sell_drink(drink)
    @drink.delete(drink)
  end

  def add_money(drink, room)
    room.bill += drink.price
  end

  def buy_drink(drink, customer, room)
    customer.add_drink(drink)
    customer.pay_drink(drink)
    sell_drink(drink)
    add_money(drink, room)
    customer.increase_drunk_level(drink)
  end

  def of_age?(customer)
    if customer.age >= 18
      return true
    else
      return false
    end
  end

  def service(customer, drink, room)
    if of_age?(customer)
      if customer.drunk_level >= 10
        room.check_out(customer)
        return "Stomach pumped mate!"
      else
        buy_drink(drink, customer, room)
        return "Here ye go mate!"
      end
    else
      return "Too young wee man"
    end
  end

end
