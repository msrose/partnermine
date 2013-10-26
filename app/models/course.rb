class Course < ActiveRecord::Base
  validates :code, :presence => true, :uniqueness => { :case_sensitive => false }
  has_many :sections
end
