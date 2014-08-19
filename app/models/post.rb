class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :religion
  has_many :religions
  has_many :modification_histories
  has_many :comments
  validates :user_id, presence: true
  acts_as_votable 
end
