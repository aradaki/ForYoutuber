class CreateYoutubers < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubers do |t|
      t.string :name, null: false
      t.string :image_id
      t.text :introduction, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
