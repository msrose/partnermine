class SectionStudent < ActiveRecord::Base
  belongs_to :section
  belongs_to :student

  validates :section_id, :uniqueness => { :scope => :student_id }
end
