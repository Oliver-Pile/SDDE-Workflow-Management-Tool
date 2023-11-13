class CardsController < ApplicationController

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @card = @project.cards.build(card_params)

    if @card.save
      redirect_to project_url(@project), notice: "Card was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def card_params
    params.require(:card).permit(:content, :status)
  end
end