class AddWodTimeToWods < ActiveRecord::Migration
  def change
    add_column :wods, :wodtime, :string
  end
end
