class AnswersController < ApplicationController
  def new
    @card = Card.where('review_date <= NOW()').order('RANDOM()').first
  end

  def create
    @card = Card.find_by_id(params[:id])
    notice = "Wrong answer! Correct was \"#{@card.translated_text}\""
    if @card.translated_text == params[:answer]
      notice = 'You are right!'
      @card.update(review_date: 3.days.since(Time.now))
    end
    redirect_to new_answer_path, notice: notice
  end
end
