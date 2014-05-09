class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :number
      t.string :name
      t.string :phones

      t.integer :device_id

      t.timestamps
    end
  end
end
