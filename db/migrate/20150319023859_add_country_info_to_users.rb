class AddCountryInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birth_country, :string
    add_column :users, :home_country, :string
    add_column :users, :ip_country, :string
    add_column :users, :register_ip, :string
    add_column :users, :last_login_ip, :string
  end
end
