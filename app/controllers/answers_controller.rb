class AnswersController < ApplicationController
  def new
    @card = Card.where('review_date <= NOW()').order('RANDOM()').first
  end

  def create
    result = CheckAnswer.call(params)
    notice = if result.success?
               t('.correct')
             else
               t('.wrong')
             end
    redirect_to root_path, notice: notice
  end
end
