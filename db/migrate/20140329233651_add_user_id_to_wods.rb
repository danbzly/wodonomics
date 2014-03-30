class AddUserIdToWods < ActiveRecord::Migration
  def change
    add_column :wods, :user_id, :integer
    add_index :wods, :user_id
  end
end
