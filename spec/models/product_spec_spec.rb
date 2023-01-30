require 'rails_helper'

RSpec.describe ProductSpec, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    # before :each do
    #   @test_cat = Category.new
    #     @test_cat.id = 1
    #     @test_cat.name = "test_cat" 
    #   @test_prod = Product.new
    #     @test_prod.category_id = 1
    #     @test_prod.name = "test_name"
    #     @test_prod.description = "test_description"
    #     @test_prod.image = "test_image n/a"
    #     @test_prod.quantity = 1
    #     @test_prod.price = 100
    #   # name, description, image, quantity, price, category
    # end
    
    it "Validates :name, presence:true" do
      @test_prod = Product.new
        @test_prod.category_id = 1
        @test_prod.name = "test_name"
        @test_prod.description = "test_description"
        @test_prod.image = "test_image n/a"
        @test_prod.quantity = 1
        @test_prod.price = 100

      @test_prod.save!
      expect(@test_prod.name).to be_present
    end

    it "Validates :price, presence:true" do 
      @test_prod = Product.new
        @test_prod.category_id = 1
        @test_prod.name = "test_name"
        @test_prod.description = "test_description"
        @test_prod.image = "test_image n/a"
        @test_prod.quantity = 1
        @test_prod.price = 100

      @test_prod.save!
      expect(@test_prod.price).to be_present
    end

    it "Validates :quantity, presence:true" do 
      @test_prod = Product.new
        @test_prod.category_id = 1
        @test_prod.name = "test_name"
        @test_prod.description = "test_description"
        @test_prod.image = "test_image n/a"
        @test_prod.quantity = 1
        @test_prod.price = 100

      @test_prod.save!
      expect(@test_prod.quantity).to be_present
    end

    it "Validates :category, presence:true" do 
      @test_prod = Product.new
        @test_prod.category_id = 1
        @test_prod.name = "test_name"
        @test_prod.description = "test_description"
        @test_prod.image = "test_image n/a"
        @test_prod.quantity = 1
        @test_prod.price = 100

      @test_prod.save!
      expect(@test_prod.category_id).to be_present
    end    

    it "Expects an error if name (price, quantity, or category) are missing. This test checks for name blank validation error."  do
      @test_prod = Product.new
        @test_prod.category_id = 1
        @test_prod.name = ""
        @test_prod.description = "test_description"
        @test_prod.image = "test_image n/a"
        @test_prod.quantity = 1
        @test_prod.price = 100
    
      expect {@test_prod.save!}.to raise_exception("Validation failed: Name can't be blank")
      # .errors.full_messages

    
    end

  end
end