class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :number
      t.text :title
      t.text :url
      t.string :last_visited
      t.string :created

      t.boolean :is_bookmark
      t.integer :visits

      t.integer :device_id

      t.timestamps
    end
  end
end
