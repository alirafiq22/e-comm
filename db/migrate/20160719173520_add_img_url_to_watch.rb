class AddImgUrlToWatch < ActiveRecord::Migration
  def change
    add_column :watches, :imgurl, :text
  end
end
