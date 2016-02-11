class AddOwnerToWatches < ActiveRecord::Migration
  def change
    add_column :watches, :owner, :integer
  end
end
