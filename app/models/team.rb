class Team < ApplicationRecord
  belongs_to :course
  has_many :team_members
  has_many :project_teams
  has_many :projects, through: :project_teams
end
