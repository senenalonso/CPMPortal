class ProjectsController < ApplicationController
  include SearchHelper
  
  skip_before_filter :verify_authenticity_token
  before_action :set_project, only: [:show, :edit, :update, :destroy, :assign, :close, :report]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new    
  end

  # GET /projects/1/edit
  def edit
    session[:project_id] = params[:id]
    @components = @project.components 
    @component = Component.new  
    @advice = Advice.new
  end

  # POST /projects
  # POST /projects.json
  def create    

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
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
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
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
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign
    @project.status="En curso"
    current_user.projects.push(@project)
    redirect_to edit_project_path(@project), notice: 'Project was successfully assigned.'
  end

  def close
    @project.status="Cerrado"
    @project.save
    redirect_to home_path, notice: 'Project was successfully closed.'
  end

  def search
    if request.method == "POST" 
      filter = ""

      if params[:code] != ""
        params[:code] = "CO"+params[:code]
      end

      filter = build_filter(params)

      @projects = Project.get_projects_by_filter(filter)

      render 'projects/index'
    end
  end

  def report
    render 'report', layout: 'pdf'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:code, :name, :description, :result, :date_requested, :date_start, :date_finish, :scope, :action, :priority)
    end
end
