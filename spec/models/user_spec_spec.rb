require 'rails_helper'

RSpec.describe UserSpec, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    before :each do
      @test_user1 = User.new
        @test_user1.first_name = "test1_Fname" 
        @test_user1.last_name = "test1_Lname" 
        @test_user1.email = "test1@test.com" 
        @test_user1.password = "test1_password" 
        @test_user1.password_confirmation = "test1_password" 

        @test_user1.save
      end

  # It must be created with a password and password_confirmation fields
    it "Check that it fails if password field is missing" do
      @test_user2 = User.new(first_name: "test2_Fname", last_name: "test2_Lname", email: "test2@test.com", password: "", password_confirmation: "test2_password")
      @test_user2.save

      expect(@test_user2.errors.full_messages).to include("Password can't be blank")
    end

    it "Check that it fails if password confirmation field is missing" do
      @test_user2 = User.new(first_name: "test2_Fname", last_name: "test2_Lname", email: "test2@test.com", password: "test2_password", password_confirmation: "")
      @test_user2.save

      expect(@test_user2.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  
  # These need to match so you should have an example for where they are not the same
    it "Check that it fails if password does not match password confirmation" do
      @test_user2 = User.new(first_name: "test2_Fname", last_name: "test2_Lname", email: "test2@test.com", password: "test2_password", password_confirmation: "test2_wrongpassword")
      @test_user2.save

      expect(@test_user2.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  # These are required when creating the model so you should also have an example for this
    # Email, first name, and last name should also be required
    it "Check that it fails if there is no first name" do
      @test_user2 = User.new(first_name: "", last_name: "test2_Lname", email: "test2@test.com", password: "test2_password", password_confirmation: "test2_password")
      @test_user2.save
  
      expect(@test_user2.errors.full_messages).to include("First name can't be blank")
    end
  
    it "Check that it fails if there is no last name" do
      @test_user2 = User.new(first_name: "test2_Fname", last_name: "", email: "test2@test.com", password: "test2_password", password_confirmation: "test2_password")
      @test_user2.save
  
      expect(@test_user2.errors.full_messages).to include("Last name can't be blank")
    end
  
    it "Check that it fails if there is no last email" do
      @test_user2 = User.new(first_name: "test2_Fname", last_name: "test2_Lname", email: "", password: "test2_password", password_confirmation: "test2_password")
      @test_user2.save
      
      expect(@test_user2.errors.full_messages).to include("Email can't be blank")
    end
    
    # Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
    it "Check that it fails if email is taken and for case insensitivity" do      
      @test_user2 = User.new(first_name: "test2_Fname", last_name: "test2_Lname", email: "teSt1@tEst.coM", password: "test2_password", password_confirmation: "test2_password")
      @test_user2.save


      expect(@test_user2.errors.full_messages).to include("Email has already been taken")
    end

  # The password must have a minimum length when a user account is being created.
    it "Check that it fails if password is < 5 characters" do
      @test_user2 = User.new(first_name: "test2_Fname", last_name: "test2_Lname", email: "test2@test.com", password: "shor", password_confirmation: "shor")
      @test_user2.save

      expect(@test_user2.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

  
  end
end
