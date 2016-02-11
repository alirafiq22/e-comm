class AddColumnsToWatches < ActiveRecord::Migration
  def change
   
    add_column :watches, :mno, :integer
    add_column :watches, :company, :string
    add_column :watches, :qty, :integer
  end
end
