class AddAttachmentImageToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :documents, :image
  end
end
