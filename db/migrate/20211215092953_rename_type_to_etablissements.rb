class RenameTypeToEtablissements < ActiveRecord::Migration[6.1]
  def change
    rename_column :etablissements, :type, :typeeta

  end
end
