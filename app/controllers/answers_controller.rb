class AnswersController < ApplicationController
  def new
    @card = GetCardForDefault.call(default_deck)
  end

  def create
    card = Card.find(params[:id])
    notice = CheckAnswer.call(card, params[:answer])
    redirect_to root_path, notice: notice
  end

  private

  def default_deck
    current_user&.deck
  end
end
