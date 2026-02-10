class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :phone1
      t.string :phone2
      t.string :phone3
      t.string :telegram
      t.string :max
      t.string :whatsapp
      t.string :vk

      t.timestamps
    end
  end
end
