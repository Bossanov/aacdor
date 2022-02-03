class ModifyEtablissement < ActiveRecord::Migration[6.1]
  def change

    remove_column :etablissements, :pcreta
    remove_column :etablissements, :siret
    remove_column :etablissements, :typeeta
    remove_column :etablissements, :nom

    add_column :etablissements, :complementrue, :string
    add_column :etablissements, :statut, :string, default: "yes"
    add_column :etablissements, :pcr_id, :string
    add_column :etablissements, :siret, :string
    add_column :etablissements, :typeeta, :string
    add_column :etablissements, :nom, :string


  end
end
