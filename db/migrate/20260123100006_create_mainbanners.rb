class CreateMainbanners < ActiveRecord::Migration[8.0]
  def change
    create_table :mainbanners do |t|
      t.string :title
      t.text :body
      t.string :link

      t.timestamps
    end
  end
end
