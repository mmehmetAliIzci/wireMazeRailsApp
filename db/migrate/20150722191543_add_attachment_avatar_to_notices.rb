class AddAttachmentAvatarToNotices < ActiveRecord::Migration
  def self.up
    change_table :notices do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :notices, :avatar
  end
end
