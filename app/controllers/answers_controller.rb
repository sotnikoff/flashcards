class AnswersController < ApplicationController
  def index; end

  def create
    card = Card.find(params[:id])
    respond_to do |format|
      format.html do
        notice = CheckAnswer.call(card, params[:answer])
        redirect_to root_path, notice: notice
      end
      format.json { render json: { status: 'success' } }
    end
  end
end
