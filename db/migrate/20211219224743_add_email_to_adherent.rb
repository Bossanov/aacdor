class AddEmailToAdherent < ActiveRecord::Migration[6.1]
  def change
    add_column :adherents, :email, :string
  end
end
