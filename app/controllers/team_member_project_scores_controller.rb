class TeamMemberProjectScoresController < ApplicationController
  before_action :set_team_member_project_score, only: [:show, :edit, :update, :destroy]

  # GET /team_member_project_scores
  # GET /team_member_project_scores.json
  def index
    if params[:project_team_id]
      @team_member_project_scores = TeamMemberProjectScore.where project_team_id: params[:project_team_id]
      @project = Project.find params[:project_id]
      @team = ProjectTeam.find(params[:project_team_id]).team

      # show links to create the scores not yet created by project team member
      @team_members = TeamMember
        .joins(team: :project_teams)
        .where(project_teams: { id: params[:project_team_id] })
        .reject { |tm| @team_member_project_scores.any? { |tms| tm.id == tms.team_member_id } }
    else
      @team_member_project_scores = TeamMemberProjectScore.all
    end
  end

  # GET /team_member_project_scores/1
  # GET /team_member_project_scores/1.json
  def show
  end

  # GET /team_member_project_scores/new
  def new
    @team_member_project_score = TeamMemberProjectScore.new
    @team_member_project_score.project_team_id = params[:project_team_id] 
    @team_member_project_score.team_member_id = params[:team_member_id] 

    @project = Project.find params[:project_id]
    @team = ProjectTeam.find(params[:project_team_id]).team
    @member = TeamMember.find params[:team_member_id] 
  end

  # GET /team_member_project_scores/1/edit
  def edit
    @project = Project.find params[:project_id]
    @team = ProjectTeam.find(params[:project_team_id]).team
    @member = TeamMember.find params[:id] 
  end

  # POST /team_member_project_scores
  # POST /team_member_project_scores.json
  def create
    @team_member_project_score = TeamMemberProjectScore.new(team_member_project_score_params)
    @team_member_project_score.project_team_id = params[:project_team_id]

    respond_to do |format|
      if @team_member_project_score.save
        format.html { redirect_to course_project_project_team_team_member_project_scores_path(course_id: params[:course_id], project_id: params[:project_id], project_team_id: params[:project_team_id]), notice: 'Team member scored.' }
        format.json { render :show, status: :created, location: @team_member_project_score }
      else
        @project = Project.find params[:project_id]
        @team = ProjectTeam.find(params[:project_team_id]).team
        @member = ProjectMember.find team_member_project_score.team_member_id

        format.html { render :new }
        format.json { render json: @team_member_project_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_member_project_scores/1
  # PATCH/PUT /team_member_project_scores/1.json
  def update
    respond_to do |format|
      if @team_member_project_score.update(team_member_project_score_params)
        format.html { redirect_to course_project_project_team_team_member_project_scores_path(course_id: params[:course_id], project_id: params[:project_id], project_team_id: params[:project_team_id]), notice: 'Team member was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_member_project_score }
      else
        @project = Project.find params[:project_id]
        @team = ProjectTeam.find(params[:project_team_id]).team
        @member = ProjectMember.find params[team_member_project_score.team_member_id]

        format.html { render :edit }
        format.json { render json: @team_member_project_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_member_project_scores/1
  # DELETE /team_member_project_scores/1.json
  def destroy
    @team_member_project_score.destroy
    respond_to do |format|
      format.html { redirect_to team_member_project_scores_url, notice: 'Team member project score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_member_project_score
      @team_member_project_score = TeamMemberProjectScore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_member_project_score_params
      params.require(:team_member_project_score).permit(:score, :team_member_id, :project_team_id)
    end
end
