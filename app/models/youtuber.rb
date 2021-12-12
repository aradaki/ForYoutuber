class Youtuber < ApplicationRecord
  has_many :youtuber_tags,dependent: :destroy
  has_many :tags,through: :youtuber_tags
end
