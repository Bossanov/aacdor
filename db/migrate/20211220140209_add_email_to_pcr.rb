class AddEmailToPcr < ActiveRecord::Migration[6.1]
  def change
    add_column :pcrs, :email, :string

  end
end
