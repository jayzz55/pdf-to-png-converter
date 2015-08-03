class AddAttachmentAssetToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :pages, :asset
  end
end
