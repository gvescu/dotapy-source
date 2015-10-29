class CreateTinymceImages < ActiveRecord::Migration
  def change
    create_table :tinymce_images do |t|
      t.string :alt
      t.string :hint

      t.timestamps null: false
    end
  end
end
