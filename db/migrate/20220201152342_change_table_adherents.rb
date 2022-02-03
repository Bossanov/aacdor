class ChangeTableAdherents < ActiveRecord::Migration[6.1]
  def change
    remove_reference :adherents, :etablissement, foreign_key: true, index: true
    remove_column :adherents, :etablissement
    remove_column :adherents, :pcr
    remove_column :adherents, :emploi

    add_column :adherents, :statut, :string
    add_column :adherents, :etablissement_id, :string



  end
end
