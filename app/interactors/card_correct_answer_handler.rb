module CardCorrectAnswerHandler
  extend self

  REVIEW_DATE_VALUES = [12.hours, 3.days, 1.week, 2.weeks, 1.month].freeze

  def call(card)
    card if card.update(step: sum_step(card),
                        fails: 0,
                        review_date: card.review_date += REVIEW_DATE_VALUES[card.step])
  end

  private

  def sum_step(card)
    card.step += 1 unless card.step >= 4
  end
end
