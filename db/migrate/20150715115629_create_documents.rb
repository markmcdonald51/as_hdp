class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :subtitle
      t.text :summary
      t.text :body
      t.date :date_of_creation
      t.references :documentable, polymorphic: true, index: true
      t.string :aasm_state
      t.string :usage

      t.timestamps null: false
    end
  end
end
