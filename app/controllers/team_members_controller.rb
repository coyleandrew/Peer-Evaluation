class TeamMembersController < ApplicationController
  before_action :set_team_member, only: [:show, :edit, :update, :destroy]

  # GET /team_members
  # GET /team_members.json
  def index
    if params[:team_id]
      puts "get team members by team id #{params[:team_id]}"
      @team_members = TeamMember.where team_id: params[:team_id]
    else
      puts "get all team members"
      @team_members = TeamMember.all
    end
  end

  # GET /team_members/1
  # GET /team_members/1.json
  def show
  end

  # GET /team_members/new
  def new
    @team_member = TeamMember.new
    if params[:team_id]
      @team_member.team_id = params[:team_id]
    end
  end

  # GET /team_members/1/edit
  def edit
  end

  # POST /team_members
  # POST /team_members.json
  def create
    @team_member = TeamMember.new(team_member_params)
    @team_member.team_id = params[:team_id]

    respond_to do |format|
      if @team_member.save
        format.html { redirect_to course_team_path(course_id: params[:course_id], id: params[:team_id]), notice: 'Team member was successfully added.' }
        format.json { render :show, status: :created, location: @team_member }
      else
        format.html { redirect_to course_team_path(course_id: params[:course_id], id: params[:team_id]), notice: 'Team member could not be added.' }
        format.json { render json: @team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_members/1
  # PATCH/PUT /team_members/1.json
  def update
    respond_to do |format|
      if @team_member.update(team_member_params)
        format.html { redirect_to course_team_path(course_id: params[:course_id], id: params[:team_id]), notice: 'Team member was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_member }
      else
        format.html { render :edit }
        format.json { render json: @team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_members/1
  # DELETE /team_members/1.json
  def destroy
    @team_member.destroy
    respond_to do |format|
      format.html { redirect_to course_team_path(course_id: params[:course_id], id: params[:team_id]), notice: 'Team member was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_member_params
      params.require(:team_member).permit(:team_id, :course_roster_id)
    end
end
