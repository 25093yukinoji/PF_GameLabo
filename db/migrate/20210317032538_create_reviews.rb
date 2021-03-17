class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :game_id
      t.text    :body
      t.float   :rate

      t.timestamps
    end
  end
end
