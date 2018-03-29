class User < ApplicationRecord
  has_many :cards
  has_many :decks
end
