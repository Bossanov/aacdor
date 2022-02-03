class RenameTypeToGenerateurbase < ActiveRecord::Migration[6.1]
  def change


    rename_column :generateurbases, :type, :typegen
    rename_column :capteurbases, :type, :typecap




  end
end
