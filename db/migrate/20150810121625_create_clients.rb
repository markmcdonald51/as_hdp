class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.float :lat
      t.float :lng
      t.references :clientele, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
