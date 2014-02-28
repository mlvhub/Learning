class CreateShopengineCategories < ActiveRecord::Migration
  def change
    create_table :shopengine_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
