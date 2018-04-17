class User < ApplicationRecord
  has_many :cards
  has_many :decks
  belongs_to :deck, optional: true
  scope :with_cards,
    -> { where(id: Card.distinct.where('review_date <= ?', Time.now).pluck(:user_id)) }
end
