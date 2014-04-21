class Client < ActiveRecord::Base

  belongs_to :partner

  validates(:name,     { :presence     => true })

end
