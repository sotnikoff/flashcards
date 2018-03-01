class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]

  def index
    @cards = Card.all
  end

  def show; end

  def edit; end

  def new
    @card = Card.new
  end

  def update
    if CheckCard.call(card_params) && @card.update(card_params)
      redirect_to @card, notice: t('.success')
    else
      redirect_to edit_card_path(@card), notice: t('.failure')
    end
  end

  def create
    if CheckCard.call(card_params) && Card.create(card_params)
      redirect_to cards_path, notice: t('.success')
    else
      render :new, notice: t('.failure')
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path, notice: t('.success')
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end

end
