class AddColumnToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :business_account, :boolean
    add_column :users, :block, :boolean
  end
end
