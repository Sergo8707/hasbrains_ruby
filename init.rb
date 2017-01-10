require_relative "store_application"
StoreApplication.config do |app|

  app.name = "My Store"
  app.environment = :production

  app.admin do |admin|
    admin.email = "example@gmail.com"
    admin.login = "admin"
    admin.send_info_emails_on :mondays
  end

end
# 40

unless StoreApplication.frozen?
  StoreApplication.name = "My name"
end

#StoreApplication::Admin.email = "new_mail@mail.ru"
p StoreApplication::Admin.email

@items =[]

@items << AntiqueItem.new("car", price: 101, weight: 100)
@items << RealItem.new(weight: 100, price: 101, name: "kettle")
@items << RealItem.new(weight: 100, price: 101, name: "dishwasher")

@items.each { |i| puts i.name }

cart = Cart.new("sergiy")
cart.add_item RealItem.new({:weight => 100, :price => 101, :name => "car"})
cart.add_item RealItem.new({:weight => 100, :price => 150, :name => "car"})
cart.add_item RealItem.new({:weight => 100, :price => 120, :name => "kettle"})

order = Order.new
@items.each { |i| order.add_item(i)}
order.place