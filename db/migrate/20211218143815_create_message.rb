class CreateMessage < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :nom, null: false
      t.string :prenom, null: false
      t.string :adresse, null: false
      t.string :email, null: false
      t.string :telephone, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
