class User < ActiveRecord::Base

  has_secure_password
  validates :name, presence: true
  validates( :email, { :uniqueness => true, :presence => true } )
  validates :password, length: { minimum: 5 } 

  def self.authenticate_with_credentials(email, password)
    #user = self.where("email = '#{email}'")
    #if(user.authenticate(password))
      #return user
    #end
    #where("email = '#{email}' AND password_digest = '#{password}'").first
  end
end
