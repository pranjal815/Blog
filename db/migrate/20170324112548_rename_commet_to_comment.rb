class RenameCommetToComment < ActiveRecord::Migration[5.0]
  def change
    rename_table :commets, :comments
  end
end
