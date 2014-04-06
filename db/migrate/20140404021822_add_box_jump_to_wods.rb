class AddBoxJumpToWods < ActiveRecord::Migration
  def change
    add_column :wods, :box_jump, :string
  end
end
