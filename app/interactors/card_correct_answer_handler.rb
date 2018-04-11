module CardCorrectAnswerHandler
  extend self

  REVIEW_DATE_VALUES = [0, 12.hours, 3.days, 1.week, 2.weeks, 1.month].freeze

  def call(card)
    card.step += 1 unless card.step >= 4
    card.fails = 0
    card.review_date += REVIEW_DATE_VALUES[card.step]
    card.save
  end
end
