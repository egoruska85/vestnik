class AddColumnToAds < ActiveRecord::Migration[8.0]
  def change
    add_column :ads, :public, :boolean
  end
end
