class User < ActiveRecord::Base

  has_many :partners
  has_many :clients, :through => :partners
  has_many :assignments, :through => :clients
  has_many :notes, :through => :assignments

  has_many :assignment_types

  validates(:email,     { :presence     => true })
  validates(:email,    { :uniqueness   => { case_sensitive: false }})

  validates(:name,     { :presence     => true })

  has_secure_password

end