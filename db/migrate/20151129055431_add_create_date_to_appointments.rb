class AddCreateDateToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :create_date, :date
  end
end
