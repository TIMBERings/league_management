class League < ActiveRecord::Base
  belongs_to :alley
  belongs_to :administrator, class_name: 'User', foreign_key: 'administrator_id'
  has_many :teams
end
