module CheckAnswer
  extend self

  def call(compare_object, answer)
    calc = SuperMemo.calculate(
      translated_text: compare_object.translated_text,
      answer: answer,
      step: compare_object.step,
      easiness: compare_object.easiness,
      interval: compare_object.interval
    )
    compare_object.update(easiness: calc[:easiness], step: calc[:step], interval: calc[:interval])
    calc[:result] == :correct ? I18n.t('answers.create.correct') : I18n.t('answers.create.wrong')
  end
end
