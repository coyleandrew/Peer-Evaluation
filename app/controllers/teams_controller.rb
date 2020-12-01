class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    if params[:course_id]
      puts "Get teams for course #{params[:course_id]}"
      @teams = Team.where course_id: params[:course_id]
    else
      @teams = Team.all
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @students = CourseRoster.joins(:user)
      .where(course_id: @team.course_id)
      .reject { |cr| @team.team_members.any? { |tm| tm.user.email == cr.user.email } }
  end

  # GET /teams/new
  def new
    @team = Team.new
    @team.course_id = params[:course_id]
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.course_id = params[:course_id]

    respond_to do |format|
      if @team.save
        format.html { redirect_to course_teams_path(course_id: @team.course_id), notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to course_team_path(course_id: @team.course_id, id: @team.id), notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to course_teams_path(course_id: @team.course_id), notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :course_id)
    end
end
