require 'rails_helper'

RSpec.describe UserSpec, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    before :each do
      @test_user = User.new
        @test_user.name = "test1_name" 
        @test_user.email = "test1@test.com" 
        @test_user.password = "test1_password" 
        @test_user.password_confirmation = "test1_password" 

        @test_user.save
    end

  # It must be created with a password and password_confirmation fields
  it "Check that it fails if password field is missing" do
    @test_user2 = User.new(name: "test2_name", email: "test2@test.com", password: "", password_confirmation: "test2_password")
    @test_user2.save

    expect(@test_user2.errors.full_messages).to include("Password can't be blank")
  end
  
  # These need to match so you should have an example for where they are not the same
  
  # These are required when creating the model so you should also have an example for this

  # Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)

  # Email, first name, and last name should also be required

end
end
