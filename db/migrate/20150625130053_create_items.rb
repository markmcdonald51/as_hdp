class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :subheading
      t.date :date_of_creation
      t.text :summary

      t.date :date_available
      t.date :date_unavailable
      # t.references :unit_of_measurement
      t.integer :units_available
      t.boolean :preorder

      t.string :ancestry
      t.float :unit_price

      t.string :youtube_url
      t.integer :position

      t.float :lat
      t.float :lng
      t.string :location
      t.references :itemable, polymorphic: true, index: true
      t.string :usage
      t.boolean :visible

      t.string :aasm_state
      #t.references :artist, index: true
      #t.references :category, index: true

      t.timestamps null: false
    end
  end
end
