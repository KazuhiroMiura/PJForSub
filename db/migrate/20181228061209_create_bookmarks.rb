class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.string :url
      t.string :category
      t.string :memo

      t.timestamps
    end
  end
end
