class CreateAdherent < ActiveRecord::Migration[6.1]
  def change
    create_table :adherents do |t|

      t.string :rue, null: false
      t.string :codepostal, null: false
      t.string :ville, null: false
      t.string :departement, null: false
      t.string :nom, null: false
      t.string :prenom, null: false
      t.string :siret, null: false
      t.string :emploi, null: false
      t.string :tauxhorairesemaine, null: false
      t.string :naissance, null: false
      t.string :sexe, null: false
      t.string :telephone, null: false
      t.string :numsecu, null: false
      t.string :respactnucleaire, null: false

      # add_reference :adherents, :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
