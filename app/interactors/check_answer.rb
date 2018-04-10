module CheckAnswer
  def self.call(compare_object, answer)
    if compare_answers(compare_object.translated_text, answer)
      compare_object.update(review_date: 3.days.since)
      CardCorrectAnswerHandler.call(compare_object)
      I18n.t('answers.create.correct')
    else
      CardFailHandler.call(compare_object)
      I18n.t('answers.create.wrong')
    end
  end

  def self.compare_answers(translated_text, answer)
    translated_text.casecmp(answer.strip).zero?
  end

  private_class_method :compare_answers
end
