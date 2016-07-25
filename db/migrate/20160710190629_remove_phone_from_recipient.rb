class RemovePhoneFromRecipient < ActiveRecord::Migration
  def change
    remove_column :recipients, :phone
    add_column :recipients, :phone, :string
  end
end
