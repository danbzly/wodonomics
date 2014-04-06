class AddMovementsToWods < ActiveRecord::Migration
    def change
  create_table :movements do |t|
	t.column :box_jump, :string
	t.column :jump_rope, :string
	t.column :wall_ball, :string
	t.column :snatch, :string
	t.column :created_at, :timestamp
     end
  end
end
