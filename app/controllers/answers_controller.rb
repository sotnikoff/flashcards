class AnswersController < ApplicationController
  def new
    @card = GetCardForDefault.call(current_user)
  end

  def create
    card = Card.find(params[:id])
    notice = CheckAnswer.call(card, params[:answer])
    redirect_to root_path, notice: notice
  end
end
