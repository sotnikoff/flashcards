module SuperMemo
  extend self
  MISTAKES_RATIO = 0.15

  def calculate(translated_text, answer, step, easiness)
    distance = calculate_distance(translated_text, answer)
    distance_limit = calculate_distance_limit(translated_text.length)
    quality = calculate_quality(step, distance, distance_limit)
    new_easiness = calculate_easiness(easiness, quality)

  end

  private

  def operate()
    params = prepare_params()
    if quality >= 3
      
    else

    end
  end

  def prepare_params(new_easiness, step, interval, previous_step)
    { easiness: new_easiness, step: step,
      interval: calculate_interval(
        interval,
        previous_step + 1, new_easiness)
    }
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
