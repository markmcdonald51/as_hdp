class CreateUnitOfMeasurements < ActiveRecord::Migration
  def change
    create_table :unit_of_measurements do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
