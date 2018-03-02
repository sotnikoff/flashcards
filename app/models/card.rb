class Card < ApplicationRecord

  validates :original_text, presence: true
  validates :translated_text, presence: true
  validate :check_text

  before_create do
    self.review_date = 3.days.since(Time.now)
  end

  def check_text
    errors.add(:original_text, :not_same_word) if compare_text
    errors.add(:translated_text, :not_same_word) if compare_text
  end

  def compare_text
    original_text == translated_text
  end
end
