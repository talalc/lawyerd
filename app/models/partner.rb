class Partner < ActiveRecord::Base
  belongs_to :user
  has_many :clients

  validates(:name,     { :presence     => true })

end
