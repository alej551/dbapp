class ChangeDateFormatAppointment < ActiveRecord::Migration
  def change
  	change_column :appointments, :create_date, :datetime
  end
end
