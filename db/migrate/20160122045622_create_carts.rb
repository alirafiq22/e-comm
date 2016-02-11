class CreateCarts < ActiveRecord::Migration
 def change
   create table :carts do |t|
     t.integer :buyer
     t.integer :mno
     t.integer :qty
   end
 end
end
