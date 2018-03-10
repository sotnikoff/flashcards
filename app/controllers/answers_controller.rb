class AnswersController < ApplicationController
  def new
    puts current_user
    @card = Card.to_review.first
  end

  def create
    card = Card.find(params[:id])
    notice = CheckAnswer.call(card, params[:answer])
    redirect_to root_path, notice: notice
  end
end
