class YoutubertTag < ApplicationRecord
  belongs_to :youtuber
  belongs_to :
  validates :youtuber_id, presence: true
  validates :tag_id, presence: true
end
