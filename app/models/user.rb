class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  attr_accessor :password_confirmation
  attr_reader :password

  validate :password_must_be_present

  class << self
    def authenticate(email, password)
      return nil if password == nil        #todo better error handing
      if user = find_by_email(email)
        testpass = encrypt_password(password, user.salt)
        if user.hashed_password == testpass
          user
        else
        end
      else
        # todo  "no user " + email + password
      end
      
    end

    def encrypt_password(password, salt)
      Digest::SHA2.hexdigest(password + "pepper" + salt)
    end
  end

  def password=(password)
    @password = password
    
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  private

  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end
  
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end
