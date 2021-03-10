class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.string :image_id
      t.string :title
      t.text :introduction
      t.float :total_rate
      t.text :site_url

      t.timestamps
    end
  end
end
