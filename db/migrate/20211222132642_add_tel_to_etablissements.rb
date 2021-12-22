class AddTelToEtablissements < ActiveRecord::Migration[6.1]
  def change
    add_column :etablissements, :email, :string
    add_column :etablissements, :telephone, :string
    add_column :etablissements, :pcr, :string

  end
end
