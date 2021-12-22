class RenamePcrToEtablissements < ActiveRecord::Migration[6.1]
  def change
    rename_column :etablissements, :pcr, :pcreta
  end
end
