require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create account when password match password confirm' do
      credentials = User.new(email: "test@test.com", password: "aaaaaa", password_confirmation: "aaaaaa", name: "John")
      expect(credentials).to be_valid
    end

    it 'should not allow account if they do not match' do
      credentials = User.new(email: "test@testa.com", password: "aaaaaa", password_confirmation: "bbbbbb", name: "Doug")
      expect(credentials).to_not be_valid
    end

    it 'expects email to be unique' do 
     user1 = User.new(email: "tesla@.com", password: "aaaaaa", password_confirmation: "aaaaaa", name: "Darrel")
     user2 = User.new(email: "tesla@.com", password: "aaaaaa", password_confirmation: "aaaaaa", name: "Don")
     user1.save
     expect(user2.save).to be false
    end

    it 'should not save if no name is inputted' do 
     user1noname = User.new(email: "teslda@.com", password: "aaaaaa", password_confirmation: "aaaaaa")
     expect(user1noname).to_not be_valid
    end

    it 'should not save if password not longer than 5' do
      users1 = User.new(email: "johngotti@gmail.com", password: "aaaaaa", password_confirmation: "aaaaaa", name: "Dane")
      expect(users1.save).to be true 
    end

   end

  describe '.authenticate_with_credentials' do 
    it 'should allow login' do
      user = User.new(name: "Karl", email: "karl@karl.com", password: "123456", password_confirmation: "123456")
      user.save

      logged_in = User.authenticate_with_credentials("karl@karl.com", "123456")
      
      expect(logged_in).to be_nil

    end
   it 'should not allow access with wrong email' do
    user = User.new(name: "John", email: "a@b.c", password: "123456", password_confirmation: "123456")
    user.save

    logged_in = User.authenticate_with_credentials("a@b.e", "123456")
    expect(logged_in).to be_nil
   end

   it 'should not allow access with wrong password' do
     user_wrong_password = User.new(name: "jeff", email: "b@b.b", password: "123456", password_confirmation: "123456")
     user_wrong_password.save
     logged_in_2 = User.authenticate_with_credentials("b@b.b", "123123")
     expect(logged_in_2).to be_nil
   end
  end

end

