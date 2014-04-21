class Partner < ActiveRecord::Base
  has_many :clients

  validates(:name,     { :presence     => true })

end
