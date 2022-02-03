class CreateTableMedecins < ActiveRecord::Migration[6.1]
  def change
    create_table :table_medecins do |t|
      t.string :nom, null: false
      t.string :prenom, null: false
      t.string :sexe, null:false
      t.string :rpps, null:false
      t.string :email, null:false
      t.string :nometa, null:false
      t.string :rue, null: false
      t.string :complementrue
      t.string :codepostal, null: false
      t.string :ville, null: false
      t.string :siret, null:false
      t.string :telephone, null: false
      t.string :siseri
      t.timestamps
    end
  end
end
