class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.text :name
      t.integer :price

      t.timestamps
    end
  end
end
