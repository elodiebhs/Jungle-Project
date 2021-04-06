require 'rails_helper'
require 'spec_helper'


# It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required

RSpec.describe User, type: :model do
  describe 'Validations' do

it "must be created with a password" do
  user = User.create(
    :name => "elodie",
    :email => "exemple@exemple.com", 
    :password => nil, 
    :password_confirmation => "123"
  )

  expect(user).to_not be_valid
  expect(user.errors.full_messages).to include "Password can't be blank"

end


it "must be created with a password_confirmation" do
  user = User.new(
    :name => "elodie",
    :email => "exemple@exemple.com", 
    :password => "123", 
    :password_confirmation => nil
  )

  expect(user).to_not be_valid
  expect(user.errors.full_messages).to include "Password confirmation can't be blank"

end

it "should check that password and password_confirmation match" do
  user = User.create(
    :name => "elodie",
    :email => "exemple@exemple.com", 
    :password => "123", 
    :password_confirmation => "1234"
  )

  expect(user).to_not be_valid
  expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"

end


it "should check that email is unique" do
  user1 = User.create(
    :name => "elodie",
    :email => "exemple@exemple.com", 
    :password => "123", 
    :password_confirmation => "123"
  )

  user2 = User.create(
    :name => "elodie",
    :email => "exemple@exempLE.com", 
    :password => "123", 
    :password_confirmation => "123"
  )

  expect(user2).to_not be_valid
  # expect(user.errors.full_messages).to include "Email must be unique"

end

it "should have a name" do
  user = User.create(
    :name => nil,
    :email => "exemple@exempLE.com", 
    :password => "123", 
    :password_confirmation => "123"
  )
  expect(user).to_not be_valid
  expect(user.errors.full_messages).to include "Name can't be blank"
end

it "should have an email" do
  user = User.create(
    :name => "elodie",
    :email => nil, 
    :password => "123", 
    :password_confirmation => "123"
  )
  expect(user).to_not be_valid
  expect(user.errors.full_messages).to include "Email can't be blank"
end


  end

end