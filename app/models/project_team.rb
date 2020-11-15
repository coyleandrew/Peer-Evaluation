class ProjectTeam < ApplicationRecord
  belongs_to :team
  belongs_to :project
  has_many :evaluations
  has_many :team_member_project_scores
end
