class DecksController < ApplicationController
  before_action :set_deck, only: %i[show edit update destroy]

  def index
    @decks = Deck.all
  end

  def show; end

  def edit; end

  def update
    if @deck.update(deck_params)
      redirect_to @deck, notice: t('.success')
    else
      render :edit
    end
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user
    if @deck.save
      redirect_to decks_path, notice: t('.success')
    else
      render :new
    end
  end

  def new
    @deck = Deck.new
  end

  def destroy
    @deck.destroy
    redirect_to decks_path, notice: t('.success')
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:title, :description, :image)
  end
end
