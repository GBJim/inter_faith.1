class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :religion
  has_many :religions
  has_many :reference_ships
end
