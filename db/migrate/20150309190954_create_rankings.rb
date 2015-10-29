class CreateRankings < ActiveRecord::Migration
  def change
    create_table :carry_rankings do |t|
    	t.references :user, index: true
    	t.integer :score, default: 2000
    	t.integer :current_position, default: 0
    	t.integer :last_position, default: 0
        t.integer :matches, default: 0
        t.integer :wins, default: 0
        t.integer :loses, default: 0
        t.integer :kills, default: 0
        t.integer :deaths, default: 0
        t.integer :assists, default: 0
        t.integer :last_hits, default: 0
        t.integer :denies, default: 0
        t.integer :top_gold_per_min, default: 0
        t.integer :top_xp_per_min, default: 0
        t.integer :penalties, default: 0
    	t.timestamps null: false
    end

    create_table :offlane_rankings do |t|
    	t.references :user, index: true
    	t.integer :score, default: 2000
    	t.integer :current_position, default: 0
    	t.integer :last_position, default: 0
        t.integer :matches, default: 0
        t.integer :wins, default: 0
        t.integer :loses, default: 0
        t.integer :kills, default: 0
        t.integer :deaths, default: 0
        t.integer :assists, default: 0
        t.integer :last_hits, default: 0
        t.integer :denies, default: 0
        t.integer :top_gold_per_min, default: 0
        t.integer :top_xp_per_min, default: 0
        t.integer :penalties, default: 0
    	t.timestamps null: false
    end

    create_table :mid_rankings do |t|
    	t.references :user, index: true
    	t.integer :score, default: 2000
    	t.integer :current_position, default: 0
    	t.integer :last_position, default: 0
        t.integer :matches, default: 0
        t.integer :wins, default: 0
        t.integer :loses, default: 0
        t.integer :kills, default: 0
        t.integer :deaths, default: 0
        t.integer :assists, default: 0
        t.integer :last_hits, default: 0
        t.integer :denies, default: 0
        t.integer :top_gold_per_min, default: 0
        t.integer :top_xp_per_min, default: 0
        t.integer :penalties, default: 0
    	t.timestamps null: false
    end

    create_table :support_rankings do |t|
    	t.references :user, index: true
    	t.integer :score, default: 2000
    	t.integer :current_position, default: 0
    	t.integer :last_position, default: 0
        t.integer :matches, default: 0
        t.integer :wins, default: 0
        t.integer :loses, default: 0
        t.integer :kills, default: 0
        t.integer :deaths, default: 0
        t.integer :assists, default: 0
        t.integer :last_hits, default: 0
        t.integer :denies, default: 0
        t.integer :top_gold_per_min, default: 0
        t.integer :top_xp_per_min, default: 0
        t.integer :penalties, default: 0
    	t.timestamps null: false
    end

    create_table :rankings do |t|
    	t.references :user, index: true
    	t.integer :score, default: 2000
        t.integer :current_position, default: 0
        t.integer :last_position, default: 0
        t.integer :matches, default: 0
        t.integer :wins, default: 0
        t.integer :loses, default: 0
        t.integer :kills, default: 0
        t.integer :deaths, default: 0
        t.integer :assists, default: 0
        t.integer :last_hits, default: 0
        t.integer :denies, default: 0
        t.integer :top_gold_per_min, default: 0
        t.integer :top_xp_per_min, default: 0
        t.integer :penalties, default: 0
    	t.timestamps null: false
    end
  end
end
