class ProjectTeam < ApplicationRecord
  belongs_to :team
  belongs_to :project
  has_many :team_member_project_scores
  def evaluations
    Evaluation.joins(:project, team_member: { team: [{ team_members: :user }]})
      .where(project_id: self.project_id, teams: { id: self.team.id }).distinct
  end
end
