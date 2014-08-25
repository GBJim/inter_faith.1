class Religion < ActiveRecord::Base

  has_many :reference_ships
  has_many :posts, :through => :reference_ships



end
