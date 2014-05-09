class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :number
      t.string :name
      t.string :kind

      t.integer :device_id

      t.timestamps
    end
  end
end
