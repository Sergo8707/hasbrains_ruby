require 'rspec'
require_relative "../app/item"
require_relative "../app/virtual_item"

describe Item do

  before(:each) do
    @item = Item.new("kettle", price: 200)
  end

  it 'calculates price according to special formula' do
    @item.price.should == 232
    @item.price = 300
  end

  it "returns info about an object" do
    @item.to_s.should == "kettle:232.0"
  end

end
