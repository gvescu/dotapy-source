class CreateMatchDetails < ActiveRecord::Migration
  def change
    create_table :match_details do |t|
      t.references :user, index: true
      t.references :match, index: true
      t.references :dota_hero, index: true
      t.integer :player_slot
      t.integer :level, default: 0
      t.integer :kills, default: 0
      t.integer :deaths, default: 0
      t.integer :assists, default: 0
      t.integer :gold, default: 0
      t.integer :last_hits, default: 0
      t.integer :denies, default: 0
      t.integer :gold_per_min, default: 0
      t.integer :xp_per_min, default: 0
      t.integer :role, default: 0
      t.integer :penalty, default: 0
      t.boolean :victory, default: false

      t.timestamps null: false
    end
    add_foreign_key :match_details, :users
    add_foreign_key :match_details, :matches
    add_foreign_key :match_details, :heros
  end
end
