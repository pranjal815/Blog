class AddAvatarsToAuthors < ActiveRecord::Migration[5.0]
  def self.up
    change_table :authors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :authors, :avatar
  end
end
