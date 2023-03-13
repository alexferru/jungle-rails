require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save successfully with all four columns' do
      product = Product.new(name: "Monstera Deliciosa", price: 100, quantity: 5, category: Category.new)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      product = Product.new(name: nil, price: 100, quantity: 5, category: Category.new)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      product = Product.new(name: "Monstera Deliciosa", price: false, quantity: 5, category: Category.new)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank") 
    end

    it 'is not valid without a quantity' do
      product = Product.new(name: "Monstera Deliciosa", price: 100, quantity: nil, category: Category.new)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      product = Product.new(name: "Monstera Deliciosa", price: 100, quantity: 5, category: nil)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end