class Assignment < ActiveRecord::Base
  belongs_to :client
  has_one :partner, :through => :client
  has_one :user, :through => :partner

  belongs_to :assignment_type

  has_many :notes

end