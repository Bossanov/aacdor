class AddCoordinateToEtablissement < ActiveRecord::Migration[6.1]
  def change
    add_column :etablissements, :latitude, :float
    add_column :etablissements, :longitude, :float
  end
end
