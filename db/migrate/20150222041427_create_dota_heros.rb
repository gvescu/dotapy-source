class CreateDotaHeros < ActiveRecord::Migration
  def change
    create_table :dota_heros do |t|
      t.string :name
      t.string :token

      t.timestamps null: false
    end
  end
end
