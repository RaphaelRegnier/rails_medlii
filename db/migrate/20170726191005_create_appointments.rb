class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :address
      t.datetime :date
      t.string :user_one_id
      t.string :user_two_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
