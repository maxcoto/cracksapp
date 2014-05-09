class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :number
      t.string :name
      t.string :date
      t.string :duration
      t.string :phone
      t.string :kind

      t.integer :device_id

      t.timestamps
    end
  end
end
