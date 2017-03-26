class CreateCommets < ActiveRecord::Migration[5.0]
  def change
    create_table :commets do |t|
      t.string :name
      t.string :email
      t.string :content
      t.integer :post_id

      t.timestamps
    end
  end
end
