module GetCardForDefault
  extend self

  def call(deck)
    (deck&.cards&.to_review || Card.without_deck.to_review).first
  end
end
