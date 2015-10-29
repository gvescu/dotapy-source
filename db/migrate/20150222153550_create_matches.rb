class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :description
      t.boolean :radiant_win, default: true
      t.string :match_id
      t.integer :game_mode
      t.integer :duration, default: 0
      t.datetime :start_time, default: DateTime.now
      t.boolean :processed, default: false
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :matches, :users
  end
end
