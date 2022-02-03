class AddItemToPcr < ActiveRecord::Migration[6.1]
  def change
    add_column :pcrs, :datenaissance, :string
    add_column :pcrs, :statut, :string
    add_column :pcrs, :dateexpdiplome, :string
    add_column :pcrs, :content, :text
    remove_column :pcrs, :departement

  end
end
