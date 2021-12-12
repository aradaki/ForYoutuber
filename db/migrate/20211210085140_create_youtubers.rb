class CreateYoutubers < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubers do |t|
      t.string :name
      t.string :image_id
      t.text :introduction

      t.timestamps
    end
  end
end
