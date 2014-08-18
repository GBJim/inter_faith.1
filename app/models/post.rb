class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :religion
  has_many :religions
  has_many :reference_ships
  has_many :modification_histories
  acts_as_votable 
end
