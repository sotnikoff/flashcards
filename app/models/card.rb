class Card < ApplicationRecord

  validates :original_text, presence: true
  validates :translated_text, presence: true
  validate do
    errors.add(:original_text, :not_same_word) if compare_text
    errors.add(:translated_text, :not_same_word) if compare_text
  end

  before_create do
    self.review_date = 3.days.since(Time.now)
  end

  def compare_text
    original_text.strip.casecmp(translated_text.strip).zero?
  end
end
