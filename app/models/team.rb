class Team < ApplicationRecord
  belongs_to :couse
  has_many :team_members
  has_many :project_teams
  has_many :projects, through: project_teams
end
