class RenameOwners < ActiveRecord::Migration
  def change
    rename_column :contacts, :owner, :owner_id
  end
end
