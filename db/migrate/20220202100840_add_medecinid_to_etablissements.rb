class AddMedecinidToEtablissements < ActiveRecord::Migration[6.1]
  def change
    add_column :etablissements, :medecin_id, :string
  end
end
