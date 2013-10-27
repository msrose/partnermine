class Section < ActiveRecord::Base
  belongs_to :course
  validates :number, :presence => true, :uniqueness => true
  validates :course_id, :presence => true

  has_many :section_students
  has_many :students, :through => :section_students
end
