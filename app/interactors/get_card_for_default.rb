module GetCardForDefault
  extend self

  def call(user)
    (default_deck(user)&.cards&.to_review || random_or_empty_deck(user))&.first
  end

  private

  def random_or_empty_deck(user)
    user&.decks&.random&.first&.cards || user&.cards&.without_deck&.to_review
  end

  def default_deck(user)
    user&.deck
  end
end
