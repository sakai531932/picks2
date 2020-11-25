class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.text :introduction
      t.string :image
      t.integer :age
      t.integer :sex
      t.integer :price
      t.string :nickname

      t.timestamps
    end
  end
end
