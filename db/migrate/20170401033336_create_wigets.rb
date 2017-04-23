class CreateWigets < ActiveRecord::Migration[5.0]
  def change
    create_table :wigets do |t|

      t.timestamps
    end
  end
end
