class Student < ActiveRecord::Base
  before_create :create_remember_token

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
  has_secure_password

  def Student.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def Student.new_remember_token
    SecureRandom.urlsafe_base64
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
