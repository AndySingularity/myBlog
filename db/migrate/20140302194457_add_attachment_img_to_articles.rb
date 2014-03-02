class AddAttachmentImgToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :img
    end
  end

  def self.down
    drop_attached_file :articles, :img
  end
end
