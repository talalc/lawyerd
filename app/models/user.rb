class User < ActiveRecord::Base

  has_many :partners
  has_many :clients, :through => :partners

  validates(:email,     { :presence     => true })
  validates(:email,    { :uniqueness   => { case_sensitive: false }})

  validates(:name,     { :presence     => true })

  has_secure_password

end