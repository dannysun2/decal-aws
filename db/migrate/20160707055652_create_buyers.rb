class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :email
      t.string :name
      t.string :phone

      t.timestamps null: false
    end
  end
end
