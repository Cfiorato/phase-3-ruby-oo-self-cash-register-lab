require 'pry'
class CashRegister
  attr_reader :discount
  attr_accessor :total, :items, :last_transaction
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, quantity = 1)
    quantity.times do 
      self.items << title
    end
    @last_transaction = price * quantity
    @total+= @last_transaction
  end

  def apply_discount
    if @discount != 0 
      perc = (100.0 - @discount.to_f) / 100
      @total = self.total.to_f * perc
      return "After the discount, the total comes to $#{@total.to_int}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end
