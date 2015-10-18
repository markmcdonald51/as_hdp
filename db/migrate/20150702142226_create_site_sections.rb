class CreateSiteSections < ActiveRecord::Migration
  def change
    create_table :site_sections do |t|
      t.string :name
      t.string :subheading
      t.text :summary
      t.integer :position
      t.boolean :visible
      t.references :layout
      t.string :ancestry

      t.timestamps null: false
    end
  end
end
