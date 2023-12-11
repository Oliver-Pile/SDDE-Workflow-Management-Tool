class ReportController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_observer, only: [:index]
  before_action :set_project
  
  def index
    @cards = @project.cards
  end

  private
  def check_user_observer
    if current_user.role != "Observer"
      flash[:danger] = "User is not authorised to view Reports"
      redirect_to root_path
    end
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
