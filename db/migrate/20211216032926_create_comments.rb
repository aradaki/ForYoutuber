class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment_content
      t.references :user, foreign_key: true
      t.references :youtuber, foreign_key: true
      t.float :rate, null: false, default: 0

      t.timestamps
    end
  end
end
