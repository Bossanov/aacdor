class AddReferenceToAdherents < ActiveRecord::Migration[6.1]
  def change
    add_reference :adherents, :user, foreign_key: true, index: true

  end
end
