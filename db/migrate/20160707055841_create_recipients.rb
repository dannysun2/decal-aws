class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_city
      t.string :address_state
      t.integer :address_zip
      t.integer :phone

      t.timestamps null: false
    end
  end
end
