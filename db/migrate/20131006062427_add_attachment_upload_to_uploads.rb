class AddAttachmentUploadToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :upload
    end
  end

  def self.down
    drop_attached_file :uploads, :upload
  end
end
