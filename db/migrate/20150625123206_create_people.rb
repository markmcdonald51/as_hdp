class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :title
      t.string :description
      t.string :email
      t.string :phone
      t.string :mobile_phone
      t.float :lat
      t.float :lng
      t.string :address
      t.string :skype
      t.references :contactable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
