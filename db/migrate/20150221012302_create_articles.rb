class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :description
      t.text :body
      t.string :slug
      t.text :tags
      t.integer :priority, default: 0
      t.boolean :hidden, default: false
      t.boolean :deleted, default: false
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :articles, :users
  end
end
