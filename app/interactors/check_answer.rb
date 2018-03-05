class CheckAnswer
  include Interactor

  def call
    card = Card.find_by_id(context.id)
    if compare_answers(card)
      card.update(review_date: 3.days.since(Time.now))
    else
      context.fail!
    end
  end

  private

  def compare_answers(card)
    card.translated_text.casecmp(context.answer.strip).zero?
  end
end
