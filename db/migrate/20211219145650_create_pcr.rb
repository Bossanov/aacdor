class CreatePcr < ActiveRecord::Migration[6.1]
  def change
    create_table :pcrs do |t|
      t.string :nom, null: false
      t.string :prenom, null: false
      t.string :rue, null: false
      t.string :codepostal, null: false
      t.string :ville, null: false
      t.string :departement, null: false
      t.string :telephone, null: false


      t.timestamps
    end
    add_reference :pcrs, :user, foreign_key: true, index: true
  end
end
