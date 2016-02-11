class CreateWatches < ActiveRecord::Migration
  def change
    create_table :watches do |t|
      t.string :company
      t.integer :mno, null: false
      t.timestamps null: false
    end
  end
end
