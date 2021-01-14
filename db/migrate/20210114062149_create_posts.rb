class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.string :mood
      t.string :content
      t.integer :likes, default: 0
      t.datetime :date

      t.timestamps
    end
  end
end
