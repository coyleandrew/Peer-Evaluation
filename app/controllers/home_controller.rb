class HomeController < ActionController::Base

    def index
        @evals = ProjectTeam.includes(:team, :project).joins(team: [{ team_members: :user }]).where(users: {id: 1})
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def setup_view_data
            @evals = CourseRoster.find_by(user_id: 1)
        end
end