class Card < ApplicationRecord
  before_create do
    self.review_date = Time.now + 3.days
  end
end
