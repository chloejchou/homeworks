class AddColumnToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :lyrics, :text
  end
end
