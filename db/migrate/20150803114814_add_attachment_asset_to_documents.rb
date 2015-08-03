class AddAttachmentAssetToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :documents, :asset
  end
end
