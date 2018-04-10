module CardCorrectAnswerHandler
  extend self
  def call(card)
    card.step += 1 unless card.step >= 5
    card.fails = 0
    card.review_date += ReviewDateValues.call(card.step.to_s)
    card.save
  end
end
