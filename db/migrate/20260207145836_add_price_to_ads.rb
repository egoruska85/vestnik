class AddPriceToAds < ActiveRecord::Migration[8.0]
  def change
    add_column :ads, :price, :decimal
  end
end
