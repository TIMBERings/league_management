class Team < ActiveRecord::Base
  has_and_belongs_to_many :bowlers, join_table: :bowlers_teams
  belongs_to :league
end
