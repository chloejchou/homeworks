class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name

      t.references :toyable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
