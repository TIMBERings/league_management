class Bowler < ActiveRecord::Base
  has_and_belongs_to_many :teams, join_table: :bowlers_teams
end
