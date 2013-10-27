class Partnership < ActiveRecord::Base
  belongs_to :section
  validates :from_id, :uniqueness => { :scope => :section_id }
  validates :to_id, :uniqueness => { :scope => :section_id }
end
