module CheckAnswer
  extend self
  def call(compare_object, answer)
    if compare_answers(compare_object.translated_text, answer)
      CardCorrectAnswerHandler.call(compare_object)
      I18n.t('answers.create.correct')
    else
      CardFailHandler.call(compare_object)
      I18n.t('answers.create.wrong')
    end
  end

  private

  def compare_answers(translated_text, answer)
    mistakes = calculate_mistakes(translated_text)
    DamerauLevenshtein.distance(prepare(translated_text), prepare(answer)) <= mistakes
  end

  def calculate_mistakes(string)
    if string.length.between?(1, 3)
      0
    elsif string.length.between?(4, 8)
      1
    else
      2
    end
  end

  def prepare(string)
    string.downcase.strip
  end

  private_class_method :compare_answers
end
