class AddStatutToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :statut, :string, default: 'adherent'
  end
end
