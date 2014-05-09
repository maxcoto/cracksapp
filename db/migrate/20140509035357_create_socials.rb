class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :number
      t.string :name
      t.string :kind
      t.string :comments
      t.string :contact_number
      t.string :raw_contact_number
      t.text :body
      t.string :timestamp
      t.string :sync1
      t.string :sync2
      t.string :sync3
      t.string :sync4

      t.integer :device_id

      t.timestamps
    end
  end
end
