class AddAttachmentFileToTinymceImages < ActiveRecord::Migration
  def self.up
    change_table :tinymce_images do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :tinymce_images, :file
  end
end
