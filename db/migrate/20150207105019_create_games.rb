class CreateGames < ActiveRecord::Migration
  def change
    create_tables :games do |t|
      t.integer :deck_position
      t.integer :user_id
      t.integer :deck_id
      t.integer :card_skipped
      t.integer :card_completed

      t.timestamps # start_times and end_times
  end
end
