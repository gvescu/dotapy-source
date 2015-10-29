class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, default: 'steam'
      t.string :uid
      t.string :nickname
      t.string :real_name
      t.string :system_name
      t.string :profile_url
      t.string :avatar_url
      t.string :visible_state
      t.string :steamid
      t.string :location
      t.boolean :admin, default: false
      t.datetime :last_seen
      t.datetime :time_created

      t.timestamps null: false
    end
  end
end
