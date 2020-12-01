class HomeController < ApplicationController

    def index
        #Show the current users dashboard
        if helpers.current_user
            @evals = ProjectTeam.includes(:team, :project, :team_member_project_scores)
                .joins(team: [{ team_members: :user }])
                .where(users: {id: helpers.current_user.id})
            @teamMemberships = TeamMember.joins(:course_roster).where course_rosters: {user_id: helpers.current_user.id}
            @projectTeams = ProjectTeam.joins(team: { team_members: :user}).where users: {id: helpers.current_user.id}
        else
            @evals = []
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def setup_view_data
            @evals = CourseRoster.find_by(user_id: 4)
        end
end