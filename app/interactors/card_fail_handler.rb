module CardFailHandler
  extend self
  def call(card)
    return card.update(fails: 0, step: 0) if card.fails >= 3
    card.fails += 1
    card.save
  end
end
