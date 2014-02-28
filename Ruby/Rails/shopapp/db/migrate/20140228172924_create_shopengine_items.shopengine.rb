# This migration comes from shopengine (originally 20140228043925)
class CreateShopengineItems < ActiveRecord::Migration
  def change
    create_table :shopengine_items do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.string :image

      t.timestamps
    end
  end
end
