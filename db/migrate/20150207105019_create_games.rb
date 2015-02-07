class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :deck_position, default: 0
      t.integer :user_id
      t.integer :deck_id
      t.integer :cards_skipped, default: 0
      t.integer :cards_completed, default: 0

      t.timestamps # start_times and end_times
    end
  end
end
