class Religion < ActiveRecord::Base
 
  has_many :posts 
  has_many :users, :through => :belief_ships
  has_many :reference_ships
  has_many :belief_ships
end
