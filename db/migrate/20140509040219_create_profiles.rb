class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :key
      t.string :value

      t.integer :device_id

      t.timestamps
    end
  end
end
