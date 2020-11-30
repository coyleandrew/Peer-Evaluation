class CourseRostersController < ApplicationController
  before_action :set_course_roster, only: [:show, :edit, :update, :destroy]

  # GET /course_rosters
  # GET /course_rosters.json
  def index
    if params[:course_id]
      @course_rosters = CourseRoster.where course_id: params[:course_id]
    else
      @course_rosters = CourseRoster.all
    end
  end

  # GET /course_rosters/1
  # GET /course_rosters/1.json
  def show
  end

  # GET /course_rosters/new
  def new
    @course_roster = CourseRoster.new
    @course_roster.course_id = params[:course_id]
  end

  # GET /course_rosters/1/edit
  def edit
  end

  # POST /course_rosters
  # POST /course_rosters.json
  def create
    @course_roster = CourseRoster.new(course_roster_params)

    respond_to do |format|
      if @course_roster.save
        format.html { redirect_to @course_roster, notice: 'Course roster was successfully created.' }
        format.json { render :show, status: :created, location: @course_roster }
      else
        format.html { render :new }
        format.json { render json: @course_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_rosters/1
  # PATCH/PUT /course_rosters/1.json
  def update
    respond_to do |format|
      if @course_roster.update(course_roster_params)
        format.html { redirect_to @course_roster, notice: 'Course roster was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_roster }
      else
        format.html { render :edit }
        format.json { render json: @course_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_rosters/1
  # DELETE /course_rosters/1.json
  def destroy
    @course_roster.destroy
    respond_to do |format|
      format.html { redirect_to course_rosters_url, notice: 'Course roster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_roster
      @course_roster = CourseRoster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_roster_params
      params.require(:course_roster).permit(:course_id, :user_id)
    end
end
