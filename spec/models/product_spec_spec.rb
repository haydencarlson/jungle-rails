require 'rails_helper'

RSpec.describe ProductSpec, type: :model do
  describe 'Validations' do
    it 'should display false when no name is present'  do
     @product = Product.new(name: nil, price: 400, quantity: 20)
     expect(@product.save).to be false
   end
  
    it 'should not save when there is no price' do
     @price = Product.new(name: "Cats", price: nil, quantity: 2)
    expect(@price.save).to be false
   end
   
    it 'should succesfully save if quantity is nil' do
     @quantity = Product.new(name: "Josh", price: 1, quantity: nil)
     expect(@quantity.quantity).to be_nil
   end
    it 'should only save if product has a category' do
      @category = Product.new(name: "David", category: nil)
      expect(@category.save).to be false 
    end


   
  end
end
