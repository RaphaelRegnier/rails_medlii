class AddFirstNameLastNameAgeLocationDescriptionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :description, :string
    add_column :users, :location, :string
  end
end
