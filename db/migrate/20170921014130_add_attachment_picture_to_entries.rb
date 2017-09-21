class AddAttachmentPictureToEntries < ActiveRecord::Migration[5.1]
  def self.up
    change_table :entries do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :entries, :picture
  end
end
