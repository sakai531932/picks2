class RemovePriceFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :price, :integer
  end
end
