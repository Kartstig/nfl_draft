class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :draft_id
      t.integer :team_id

      t.timestamps
    end
  end
end
