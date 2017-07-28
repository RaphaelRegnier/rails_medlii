class AddCoordinatesToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :latitude, :float
    add_column :appointments, :longitude, :float
  end
end
