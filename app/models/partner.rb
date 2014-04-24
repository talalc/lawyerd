class Partner < ActiveRecord::Base
  belongs_to :user
  has_many :clients
  has_many :assignments, :through => :clients

  validates(:name,     { :presence     => true })

end
