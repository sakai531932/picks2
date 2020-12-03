class RenameValueColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :value, :assessment
  end
end
