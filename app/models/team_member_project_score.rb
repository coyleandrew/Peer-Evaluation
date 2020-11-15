class TeamMemberProjectScore < ApplicationRecord
  belongs_to :team_member
  belongs_to :project_team
end
