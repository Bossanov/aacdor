class AddReferenceToEtablissement < ActiveRecord::Migration[6.1]
  def change
    add_reference :pcrs, :etablissement, foreign_key: true, index: true
  end
end
