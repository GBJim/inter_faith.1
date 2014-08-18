class Religion < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :users
  has_many :reference_ships
  has_many :belief_ships
end
