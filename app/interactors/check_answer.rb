class CheckAnswer

  def self.call(compare_object, answer)
    puts compare_object.translated_text
    puts answer
    puts compare_answers(compare_object.translated_text, answer)
    if compare_answers(compare_object.translated_text, answer)
      compare_object.update(review_date: 3.days.since(Time.now))
      I18n.t('answers.create.correct')
    else
      I18n.t('answers.create.wrong')
    end
  end

  def self.compare_answers(translated_text, answer)
    translated_text.casecmp(answer.strip).zero?
  end
end
