class Post < ActiveRecord::Base
  belongs_to :user
  has_one :embedder
  has_many :reference_ships
  has_many :religions, :through => :reference_ships
  has_many :modification_histories
  has_many :comments
  
  validates :user_id, presence: true
  acts_as_votable
  acts_as_taggable 
end
