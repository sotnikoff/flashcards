module GetCardForDefault
  extend self

  def call(user)
    return nil unless user

    return user.deck.cards.to_review.first if user.deck

    user.cards.to_review.first
  end
end
