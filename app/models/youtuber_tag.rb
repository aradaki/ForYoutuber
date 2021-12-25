class YoutuberTag < ApplicationRecord
  belongs_to :youtuber
  #belongs_to :tag
  validates :youtuber_id, presence: true
  # validates :tag_id, presence: true
end
