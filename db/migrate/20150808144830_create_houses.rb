class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :title, null: false
      t.string :owner_type, null: false
      t.string :owner
      t.string :address
      t.integer :first_vacant_year
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
