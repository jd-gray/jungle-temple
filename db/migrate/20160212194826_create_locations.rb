class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :zip_code
      t.string :country
      t.string :country_abbr
      t.string :place_name
      t.string :long
      t.string :lat
      t.string :state
      t.string :state_abbr

      t.timestamps null: false
    end
  end
end
