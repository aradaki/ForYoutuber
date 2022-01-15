class AddUrlToeYoutubers < ActiveRecord::Migration[5.2]
  def change
    add_column :youtubers, :url, :string
  end
end
