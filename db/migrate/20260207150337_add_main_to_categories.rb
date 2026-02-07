class AddMainToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :main, :boolean
  end
end
