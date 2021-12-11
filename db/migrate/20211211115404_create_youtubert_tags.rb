class CreateYoutubertTags < ActiveRecord::Migration[5.2]
  def change
    create_table :youtuber_tags do |t|
      t.references :youtuber, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
    # 同じタグを２回保存するのは出来ないようになる
    add_index :youtuber_tags, [:youtuber_id, :tag_id], unique: true
  end
end
