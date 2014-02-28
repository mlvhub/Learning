# This migration comes from shopengine (originally 20140228043818)
class CreateShopengineCategories < ActiveRecord::Migration
  def change
    create_table :shopengine_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
