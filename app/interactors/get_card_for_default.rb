module GetCardForDefault
  extend self

  def call(deck, user)
    (deck&.cards&.to_review || Card.where(user: user).without_deck.to_review).first
  end
end
