class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.string :number
      t.string :thread_number
      t.string :address
      t.string :person
      t.string :date
      t.string :protocol
      t.string :read
      t.string :status
      t.string :reply_path_present
      t.string :subject
      t.text :body
      t.string :service_center
      t.string :locked
      t.string :kind

      t.integer :device_id

      t.timestamps
    end
  end
end
