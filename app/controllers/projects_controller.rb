class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_operator, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    @projects = Project.all
  end

  def show
    if params[:user_only] == "true"
      @cards = @project.cards.only_user(current_user)
    else
      @cards = @project.cards
    end
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = 'Project was successfully created'
      redirect_to project_url(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      flash[:success] = 'Project was successfully updated'
      redirect_to project_url(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.update(active: false)
    flash[:danger] = 'Project was successfully archived'
    redirect_to projects_url
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def check_user_operator
      if !current_user.role.in?(["Dev", "Operator"])
        flash[:danger] = "User is not authorised to manipulate Project"
        redirect_to root_path
      end
    end

    def project_params
      params.require(:project).permit(:title, :description, :department, :user_only)
    end
end
