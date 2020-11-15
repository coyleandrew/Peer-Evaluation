class TeamMember < ApplicationRecord
  belongs_to :team
  belongs_to :course_roster
  has_many :team_member_project_scores
end
