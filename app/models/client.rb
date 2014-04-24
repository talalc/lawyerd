class Client < ActiveRecord::Base

  belongs_to :partner
  has_many :assignments

  validates(:name,     { :presence     => true })

end
