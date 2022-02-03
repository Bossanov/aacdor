class CreateMateriel < ActiveRecord::Migration[6.1]
  def change
    create_table :materiels do |t|
      t.string :etablissement_id, default: "NC"
      t.string :statut, default: "NC"
      t.string :typemat, default: "NC"
      t.string :marque, default: "NC"
      t.string :modele, default: "NC"
      t.string :numserie, default: "NC"
      t.string :anfab, default: "NC"
      t.string :anmes, default: "NC"
      t.string :empla, default: "NC"
      t.string :numasn, default: "NC"
      t.string :datasn, default: "NC"
      t.string :numsigis, default: "NC"
      t.string :tensionmax, default: "NC"
      t.string :intensitemax, default: "NC"
      t.string :tempsmoyen, default: "NC"
      t.string :capteurbase_id, default: "NC"
      t.string :mesorgagree, default: "NC"

















      t.timestamps
    end
  end
end
