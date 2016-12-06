class EditColName < ActiveRecord::Migration
  def change
    rename_column :contacts, :user_id, :owner
  end
end
