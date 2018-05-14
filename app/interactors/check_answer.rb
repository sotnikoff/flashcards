module CheckAnswer
  extend self

  MISTAKES_RATIO = 0.15

  # Call method for interacting as entry point
  def call(compare_object, answer)
    distance = calculate_distance(compare_object.translated_text, answer)
    distance_limit = calculate_distance_limit(compare_object.translated_text.length)
    quality = calculate_quality(compare_object.step, distance, distance_limit)
    new_easiness = calculate_easiness(compare_object.easiness, quality)

    operate(compare_object, quality, new_easiness)
  end

  private

  def operate(compare_object, quality, new_easiness)
    if quality >= 3
      store_model(new_easiness, 1, compare_object)
      I18n.t('answers.create.correct')
    else
      store_model(new_easiness, compare_object.step + 1, compare_object)
      I18n.t('answers.create.wrong')
    end
  end

  def store_model(new_easiness, step, compare_object)
    new_params = { easiness: new_easiness, step: step,
                   interval: calculate_interval(
                     compare_object.interval,
                     compare_object.step + 1, new_easiness)
    }
    compare_object.update(new_params)
  end

  # Calculates distance with Levenshtein algorithm
  def calculate_distance(translated_text, answer)
    DamerauLevenshtein.distance(prepare(translated_text), prepare(answer))
  end

  # Prepares string removing upcase characters and spaces around for use in Levenshtein algorithm
  def prepare(string)
    string.downcase.strip
  end

  # This method returns 0 - 5 quality value
  def calculate_quality(step, distance, distance_limit)
    if distance <= distance_limit
      calculate_quality_correct(step)
    else
      calculate_quality_wrong(step)
    end
  end

  # When answer is correct this method is used to return 3 - 5 quality values
  def calculate_quality_correct(attempt)
    case attempt
    when 1 then 5
    when 2 then 4
    else 3
    end
  end

  # When answer is wrong this method is used to return 0 - 2 quality values
  def calculate_quality_wrong(attempt)
    case attempt
    when 1 then 2
    when 2 then 1
    else 0
    end
  end

  def calculate_distance_limit(length)
    (length * MISTAKES_RATIO).round
  end

  def calculate_easiness(ease, quality)
    ease += (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02))
    ease < 1.3 ? 1.3 : ease
  end

  def calculate_interval(current_interval, step, easiness)
    case step
    when 1 then 1
    when 2 then 6
    else (current_interval * easiness).round
    end
  end
end
