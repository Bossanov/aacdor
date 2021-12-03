class AddCoordinatesToAdherents < ActiveRecord::Migration[6.1]
  def change
    add_column :adherents, :latitude, :float
    add_column :adherents, :longitude, :float
  end
end
