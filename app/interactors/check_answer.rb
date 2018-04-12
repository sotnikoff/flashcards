module CheckAnswer
  extend self

  MISTAKES_RATIO = 0.15

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
    mistakes = calculate_mistakes(translated_text.length)
    DamerauLevenshtein.distance(prepare(translated_text), prepare(answer)) <= mistakes
  end

  def calculate_mistakes(length)
    (length * MISTAKES_RATIO).round
  end

  def prepare(string)
    string.downcase.strip
  end
end
