class User < ActiveRecord::Base

  validates(:email,     { :presence     => true })
  validates(:email,    { :uniqueness   => { case_sensitive: false }})

  validates(:name,     { :presence     => true })

  has_secure_password

end