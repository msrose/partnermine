class Section < ActiveRecord::Base
  belongs_to :course
  validates :number, :presence => true
  validates :course_id, :presence => true
end
