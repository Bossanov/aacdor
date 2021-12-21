class AddEtablissementToAdherent < ActiveRecord::Migration[6.1]
  def change
    add_column :adherents, :etablissement, :string
  end
end
