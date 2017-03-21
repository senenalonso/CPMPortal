class ComponentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_component, only: [:show, :edit, :update, :destroy]

  # GET /components
  # GET /components.json
  def index
    @components = Component.all
  end

  # GET /components/1
  # GET /components/1.json
  def show
  end

  # GET /components/new
  def new
    @component = Component.new
    @component.project_id = session[:project_id]
  end

  # GET /components/1/edit
  def edit
  end

  # POST /components
  # POST /components.json
  def create
    @component = Component.new(component_params)
    project = Project.find(session[:project_id])

    respond_to do |format|
      if @component.save
        format.html { redirect_to edit_project_path(project), notice: 'Component was successfully created.' }
        format.json { render :show, status: :created, location: @component }
      else
        format.html { redirect_to edit_project_path(project), notice: 'Error!!' }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /components/1
  # PATCH/PUT /components/1.json
  def update
    respond_to do |format|
      if @component.update(component_params)
        format.html { redirect_to @component, notice: 'Component was successfully updated.' }
        format.json { render :show, status: :ok, location: @component }
      else
        format.html { render :edit }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.json
  def destroy
    @component.destroy
    respond_to do |format|
      format.html { redirect_to components_url, notice: 'Component was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    if request.method == "POST" 
      filter = ""
      more_than_one = false
      params.each do |p, v| 
        if (v != "" && p != "controller" && p != "action")
          if (more_than_one) 
            filter += " AND "
          else 
            more_than_one = true
          end
        end
      end

      @components = Component.get_components_by_filter(filter)

      render 'components/index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component
      @component = Component.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_params
      params.require(:component).permit(:name, :description, :category, :project_id)
    end
end
