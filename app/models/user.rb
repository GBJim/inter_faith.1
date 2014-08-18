class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :religions, :through => :belief_ships 
  has_many :belief_ships 
  has_many :interests
end
