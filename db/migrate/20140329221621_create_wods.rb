class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.string :description

      t.timestamps
    end
  end
end
