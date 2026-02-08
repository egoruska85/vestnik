class AddEmailToMainbanner < ActiveRecord::Migration[8.0]
  def change
    add_column :mainbanners, :email, :string
  end
end
