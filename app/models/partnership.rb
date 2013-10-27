class Partnership < ActiveRecord::Base
  belongs_to :sections
  belongs_to :requester, :class => 'Student', :foreign_key => :from_id
  belongs_to :requestee, :class => 'Student', :foreign_key => :from_id
end
