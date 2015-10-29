class AddAttachmentHeaderToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :header
    end
  end

  def self.down
    remove_attachment :articles, :header
  end
end
