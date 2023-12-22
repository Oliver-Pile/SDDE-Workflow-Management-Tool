class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_operator, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    if params[:user_only] == "true"
      @cards = @project.cards.only_user(current_user)
    else
      @cards = @project.cards
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = 'Project was successfully created'
      redirect_to project_url(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
      if @project.update(project_params)
        flash[:success] = 'Project was successfully updated'
        redirect_to project_url(@project)
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /projects/1
  def destroy
    @project.update(active: false)
    flash[:danger] = 'Project was successfully archived'
    redirect_to projects_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def check_user_operator
      if !current_user.role.in?(["Dev", "Operator"])
        flash[:danger] = "User is not authorised to manipulate Project"
        redirect_to root_path
      end
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description, :department, :user_only)
    end
end
