class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :profile, foreign_key: true
      t.integer :value
      t.integer :reply
      t.integer :continuity
      t.float :rate

      t.timestamps
    end
  end
end
