class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_card, only: [:show, :edit, :update]

  def show
  end

  def new
    @card = Card.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @card = @project.cards.build(card_params)

    if @card.save
      flash[:success] = 'Card saved successfully'
      redirect_to project_url(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      flash[:success] = 'Card was successfully updated'
      redirect_to project_url(@project)
    else
      render :edit, status: :unprocessable_entity
    end
end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_card
    @card = @project.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:content, :status)
  end
end