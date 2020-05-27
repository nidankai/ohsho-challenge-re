class AddUrlToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :url, :string
  end
end
