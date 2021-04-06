# Each example (it) is run in isolation of others. Therefore each example will needs its own @category created and then @product initialized with that category
# Create an initial example that ensures that a product with all four fields set will indeed save successfully
# Have one example for each validation, and for each of these:
# Set all fields to a value but the validation field being tested to nil
# Test that the expect error is found within the .errors.full_messages array




require 'rails_helper'
require 'spec_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do

    # each example will needs its own @category created and then @product initialized with that category
    
      category = Category.new :name => "material"
      

    it "should save when all 4 fields are present" do
      product = Product.new(
        :name => "chair",
        :price => 200,
        :quantity => 4,
        :category => category
      )
      expect(product).to be_valid 
    end

    it "should have a name" do
      product = Product.new(
        :name => nil,
        :price => 200,
        :quantity => 4,
        :category => category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Name can't be blank"
    end
    
    it "should have a price" do
      product = Product.new(
        :name => "chair",
        :price => nil,
        :quantity => 4,
        :category => category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Price can't be blank"
    end

    it "should have a quantity" do
      product = Product.new(
        :name => "chair",
        :price => 200,
        :quantity => nil,
        :category => category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "should have a category" do
      product = Product.new(
        :name => "chair",
        :price => 200,
        :quantity => 4,
        :category => nil
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Category can't be blank"
    end





    # validation tests/examples here
  end
end

