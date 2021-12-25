class Youtuber < ApplicationRecord
  has_many :youtuber_tags,dependent: :destroy
  has_many :comments, dependent: :destroy  #Post.commentsで、投稿が所有するコメントw取得できる。
  attachment :image
  acts_as_taggable_on :tags

  # Tag Save & Remove
  def tag_diff(tags)
    # Tag Split
    current_tags = tag_list.split(',')
    save_tags = tags.split(',')

    old_tags = (current_tags - save_tags).join(',') # Old Tags
    new_tags = (save_tags - current_tags).join(',') # New Tags

    # Remove '#'
    old_tags.delete!('#')
    new_tags.delete!('#')

    # Tag Save & Remove
    tag_list.remove(old_tags, parse: true)
    tag_list.add(new_tags, parse: true)
  end
end
