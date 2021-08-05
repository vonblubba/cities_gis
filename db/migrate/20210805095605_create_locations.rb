class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :country, null: false
      t.string :city, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.float :altitude, null: false

      t.timestamps
    end

    add_index :locations, :altitude
  end
end
