
class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = nil
    end

    def add_item(title, price, quantity = 1)
      self.total += price * quantity
      quantity.times { items << title }
      self.last_transaction = { title: title, price: price, quantity: quantity }
    end

    def apply_discount
      if discount > 0
        self.total -= total * discount / 100
        "After the discount, the total comes to $#{total}."
      else
        "There is no discount to apply."
      end
    end

    def void_last_transaction
      return if last_transaction.nil?

      last_item_total = last_transaction[:price] * last_transaction[:quantity]
      self.total -= last_item_total
      items.slice!(-last_transaction[:quantity]..-1)
      self.last_transaction = nil
    end

    private

    attr_accessor :last_transaction
  end


  # cash_register.rb