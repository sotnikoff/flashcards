class AnswersController < ApplicationController
  def index; end

  def check
    card = Card.find(params[:id])
    notice = CheckAnswer.call(card, params[:answer])
    respond_to do |format|
      format.html do
        redirect_to root_path, notice: notice
      end
      format.json { render json: { message: notice } }
    end
  end
end
