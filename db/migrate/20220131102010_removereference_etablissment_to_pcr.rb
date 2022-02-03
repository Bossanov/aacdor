class RemovereferenceEtablissmentToPcr < ActiveRecord::Migration[6.1]
  def change
    remove_reference :pcrs, :etablissement, foreign_key: true, index: true

  end
end
