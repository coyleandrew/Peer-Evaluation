class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations = Evaluation.all
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
  end

  # GET /evaluations/new
  def new
    # prevent duplicates
    if Evaluation.find_by user_id: helpers.current_user.id, project_id: params[:projectId], team_member_id: params[:teamMemberId]
      flash[:notice] = "Evaluation already submitted."
      redirect_to root_path
    end

    @evaluation = Evaluation.new
    @evaluation.project_id = params[:projectId]
    @evaluation.team_member_id = params[:teamMemberId]

    # Lookup relations
    if(@evaluation.project_id)
      @project = Project.find @evaluation.project_id
    end
    if(@evaluation.team_member_id)
      @member = TeamMember.find(@evaluation.team_member_id).user
    end
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.project_id = params[:projectId]
    @evaluation.team_member_id = params[:teamMemberId]
    @evaluation.user_id = helpers.current_user.id

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        # restore relations
        if(@evaluation.project_id)
          @project = Project.find @evaluation.project_id
        end
        if(@evaluation.team_member_id)
          @member = TeamMember.find(@evaluation.team_member_id).user
        end

        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evaluation_params
      params.require(:evaluation).permit(:score, :comment, :project_id, :team_member_id)
    end
end
