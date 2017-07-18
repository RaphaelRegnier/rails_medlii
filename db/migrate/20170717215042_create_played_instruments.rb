class CreatePlayedInstruments < ActiveRecord::Migration[5.0]
  def change
    create_table :played_instruments do |t|
      t.integer :level
      t.string :description
      t.references :user, foreign_key: true
      t.references :instrument, foreign_key: true

      t.timestamps
    end
  end
end
