class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_index :users, :firstname
  end
end
