class Student < ActiveRecord::Base
  before_create :create_remember_token

  has_many :section_students
  has_many :sections, :through => :section_students
  has_many :courses, :through => :sections

  validates :name, :presence => true
  validates :email, :uniqueness => { :case_sensitive => false }, :format => { :with => /[A-Za-z0-9]*@uwaterloo\.ca/ }
  has_secure_password

  def Student.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def Student.new_remember_token
    SecureRandom.urlsafe_base64
  end

  private

    def create_remember_token
      self.remember_token = Student.encrypt(Student.new_remember_token)
    end
end
