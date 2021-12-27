class ChangeDatatypeYoutuberIdOfYoutuberTags < ActiveRecord::Migration[5.2]
  def change
    change_column :youtuber_tags, :youtuber_id, :bigint
  end
end
