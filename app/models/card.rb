class Card < ApplicationRecord
  mount_uploader :image, CardImageUploader
  scope :to_review, lambda {
    where('review_date <= ?', Time.now).select(:id,
      :original_text, :image).order('RANDOM()').limit(1)
  }
  scope :without_deck, -> { where(deck_id: nil) }
  belongs_to :deck, optional: true
  belongs_to :user

  validates :original_text, presence: true
  validates :translated_text, presence: true
  validate do
    errors.add(:original_text, :not_same_word) if compare_text
    errors.add(:translated_text, :not_same_word) if compare_text
  end

  before_create do
    self.review_date = Time.now
  end

  def compare_text
    original_text.strip.casecmp(translated_text.strip).zero?
  end
end
