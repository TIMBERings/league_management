class Alley < ActiveRecord::Base
  belongs_to :address
  has_many :leagues
end
