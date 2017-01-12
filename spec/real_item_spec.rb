require 'rspec'
require 'rspec/collection_matchers'
require_relative '../app/item'
require_relative '../app/virtual_item'
require_relative '../app/real_item'

describe RealItem do

  it "user weight while returnig info if the condition is true" do
     item1 = RealItem.new(name: "kettle", price: 200, weight: 2)
     item2 = RealItem.new(name: "kettle", price: 200, weight: 10)
    item1_info = []
    item2_info = []
    item1.info { |attr| item1_info << attr}
    item2.info { |attr| item2_info << attr}
    item1_info.join(", ").should == "232.0, kettle"
    item2_info.join(", ").should == "10, 232.0, kettle"
  end
end
