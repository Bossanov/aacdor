class AddPcrToAdherent < ActiveRecord::Migration[6.1]
  def change
    add_column :adherents, :pcr, :string
  end
end
