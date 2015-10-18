class CreateItemMeasurements < ActiveRecord::Migration
  def change
    create_table :item_measurements do |t|
      t.references :item, index: true, foreign_key: true
      t.references :unit_of_measurement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
