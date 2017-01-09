require_relative "store_application"
# 36

puts StoreApplication.new == StoreApplication.new
p StoreApplication.new
@items =[]

@items << AntiqueItem.new("car", price: 101, weight: 100)
@items << RealItem.new(weight: 100, price: 101, name: "kettle")
@items << RealItem.new(weight: 100, price: 101, name: "dishwasher")

@items.each { |i| puts i.name }

cart = Cart.new("sergiy")
cart.add_item RealItem.new({:weight => 100, :price => 101, :name => "car"})
cart.add_item RealItem.new({:weight => 100, :price => 150, :name => "car"})
cart.add_item RealItem.new({:weight => 100, :price => 120, :name => "kettle"})

method = "all_cars"
p cart.send(method)