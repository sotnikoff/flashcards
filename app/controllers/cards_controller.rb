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
    p CheckCard.call(card_params)
    if @card.update(card_params)
      redirect_to @card, notice: t('.success')
    else
      render :edit
    end
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to @card, notice: t('.success')
    else
      render :new
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
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end

end
