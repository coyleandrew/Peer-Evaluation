class ProjectTeamsController < ApplicationController
  before_action :set_project_team, only: [:show, :edit, :update, :destroy]

  # GET /project_teams
  # GET /project_teams.json
  def index
    @project_teams = ProjectTeam.all
  end

  # GET /project_teams/1
  # GET /project_teams/1.json
  def show
  end

  # GET /project_teams/new
  def new
    @project_team = ProjectTeam.new
  end

  # GET /project_teams/1/edit
  def edit
  end

  # POST /project_teams
  # POST /project_teams.json
  def create
    @project_team = ProjectTeam.new(project_team_params)
    @project_team.project_id = params[:project_id]

    respond_to do |format|
      if @project_team.save
        format.html { redirect_to course_project_path(course_id: params[:course_id], id: params[:project_id]), notice: "Team \"#{@project_team.team.name}\" was successfully added." }
        format.json { render :show, status: :created, location: @project_team }
      else
        format.html { redirect_to course_project_path(course_id: params[:course_id], id: params[:project_id]), notice: 'Team could not be added.' }
        format.json { render json: @project_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_teams/1
  # PATCH/PUT /project_teams/1.json
  def update
    respond_to do |format|
      if @project_team.update(project_team_params)
        format.html { redirect_to @project_team, notice: "Project team was successfully updated." }
        format.json { render :show, status: :ok, location: @project_team }
      else
        format.html { render :edit }
        format.json { render json: @project_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_teams/1
  # DELETE /project_teams/1.json
  def destroy
    teamName = @project_team.team.name
    @project_team.destroy
    respond_to do |format|
      format.html { redirect_to course_project_path(course_id: params[:course_id], id: params[:project_id]), notice: "Team \"#{teamName}\" was successfully removed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_team
      @project_team = ProjectTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_team_params
      params.require(:project_team).permit(:score, :team_id, :project_id)
    end
end
