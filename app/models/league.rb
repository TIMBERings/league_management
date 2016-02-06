class League < ActiveRecord::Base
  belongs_to :alley
  has_many :teams
end
