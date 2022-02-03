class CreateCapteurbase < ActiveRecord::Migration[6.1]
  def change
    create_table :capteurbases do |t|
      t.string :marque,              null: false
      t.string :modele,              null: false
      t.string :type,              null: false

      t.timestamps
    end
  end
end
