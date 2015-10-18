class CreatePartials < ActiveRecord::Migration
  def change
    create_table :partials do |t|
      t.string :name
      t.string :rails_path
      t.string :sample_url
      t.string :aasm_string
      t.string :usage
      t.references :partialable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
