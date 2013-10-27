class Course < ActiveRecord::Base
  validates :code, :presence => true, :uniqueness => { :case_sensitive => false }
  has_many :sections
  has_many :students, :through => :sections
end
