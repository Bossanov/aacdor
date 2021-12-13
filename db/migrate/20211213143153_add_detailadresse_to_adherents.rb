class AddDetailadresseToAdherents < ActiveRecord::Migration[6.1]
  def change
    add_column :adherents, :detailadresse, :string
  end
end
