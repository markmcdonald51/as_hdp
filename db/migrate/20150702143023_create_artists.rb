class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      #t.references :user, index: true, foreign_key: true
      t.references :artistable, polymorphic: true, index: true
      t.string :name
      t.string :subtitle
      t.text :summary
      t.references :site_section, index: true, foreign_key: true
      t.string :aasm_state
      t.references :layout, foreign_key: true
      t.integer :position
      t.timestamps null: false
    end
  end
end
