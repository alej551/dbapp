class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :time
      t.string :service
      t.string :client_name
      t.string :client_email
      t.string :client_phone
     
      t.timestamps null: false
    end
    end
  end


