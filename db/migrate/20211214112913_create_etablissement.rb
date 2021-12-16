class CreateEtablissement < ActiveRecord::Migration[6.1]
  def change
    create_table :etablissements do |t|
      t.string :rue, null: false
      t.string :codepostal, null: false
      t.string :ville, null: false
      t.string :departement, null: false
      t.string :nom, null: false
      t.string :address, null: false
      t.string :type, null: false
      t.string :siret, null: false

      t.timestamps
    end
  end
end
