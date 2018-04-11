module CardFailHandler
  extend self
  def call(card)
    return card if card.fails >= 3 && card.update(fails: 0, step: 0)
    card if card.update(fails: card.fails + 1)
  end
end
