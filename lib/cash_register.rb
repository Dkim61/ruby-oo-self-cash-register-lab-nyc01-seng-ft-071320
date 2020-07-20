class CashRegister
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    attr_accessor :total, :discount, :items, :last_item_price

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times do |i|
            self.items.push(title)
        end
        self.last_item_price = price * quantity
    end  

    def apply_discount
        if self.discount > 0
            self.total = self.total * (1- (self.discount.to_f/100.0))
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_item_price
    end
        
end