class RenameMedecins < ActiveRecord::Migration[6.1]
  def change
    rename_table :table_medecins, :medecins
  end
end
