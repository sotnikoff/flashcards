class Deck < ApplicationRecord
  mount_uploader :image, CardImageUploader
  has_many :cards
  belongs_to :user
end
