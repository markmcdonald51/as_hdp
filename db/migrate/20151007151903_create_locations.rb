class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :locatable, index: true, polymorphic: true
      t.decimal :lat
      t.decimal :lng
      t.string :name
      t.string :location

      t.timestamps null: false
    end
  end
end
