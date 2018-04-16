module UsersWithCards
  extend self
  def call
    User.joins(:cards).merge(Card.where('review_date <= ?', Time.now)).group('users.id')
  end
end
