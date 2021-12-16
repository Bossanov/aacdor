class AddReferenceEtablissementToAdherents < ActiveRecord::Migration[6.1]
  def change
    add_reference :adherents, :etablissement, foreign_key: true, index: true

  end
end
