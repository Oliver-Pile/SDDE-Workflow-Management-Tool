class ReportController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  
  def index
    @cards = @project.cards
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end
end
