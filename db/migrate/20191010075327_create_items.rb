class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :author
      t.string :synopsis
      t.float :price
      t.integer :stock
      t.integer :num_sold
      t.integer :user_id
    end
  end
end
