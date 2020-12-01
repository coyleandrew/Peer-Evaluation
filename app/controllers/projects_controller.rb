class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    if params[:course_id]
      @projects = Project.where course_id: params[:course_id]
    else
      @projects = Project.all
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @teams = Team
      .where(course_id: @project.course_id)
      .reject { |t| @project.project_teams.any? { |pt| pt.team_id == t.id } }
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.course_id = params[:course_id]
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.course_id = params[:course_id]

    respond_to do |format|
      if @project.save
        format.html { redirect_to course_projects_path(course_id: @project.course_id), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to course_project_path(course_id: @project.course_id, id: @project.id), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to course_projects_path(course_id: params[:course_id]), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :due, :course_id)
    end
end