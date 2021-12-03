class AddAdressToAdherents < ActiveRecord::Migration[6.1]
  def change
    add_column :adherents, :address, :string
  end
end
