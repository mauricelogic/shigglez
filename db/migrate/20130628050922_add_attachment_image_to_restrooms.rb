class AddAttachmentImageToRestrooms < ActiveRecord::Migration
  def self.up
    change_table :restrooms do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :restrooms, :image
  end
end
