class User < ApplicationRecord
  has_many :cards
  has_many :decks
  belongs_to :deck, optional: true
end
