class BeliefShip < ActiveRecord::Base
  belongs_to :religion
  belongs_to :user
end
