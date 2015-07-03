class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.integer :votes
      t.integer :user_id

      t.timestamps null: false
    end
  end
end