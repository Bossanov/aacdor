class CreatePersonnel < ActiveRecord::Migration[6.1]
  def change
    create_table :personnels do |t|

      t.string :nom, null: false
      t.string :prenom, null: false
      t.string :numsecu, default: "NC"
      t.string :emploi, default: "NC"
      t.string :statut, default: "yes"
      t.string :sexe, default: "NC"
      t.string :etablissement_id, default: "NC"
      t.string :radiocomp, default: "NC"
      t.string :datenaissance, default: "NC"
      t.string :rue, default: "NC"
      t.string :codepostal, default: "NC"
      t.string :ville, default: "NC"
      t.string :email, default: "NC"
      t.string :telephone, default: "NC"







      t.timestamps
    end
  end
end
