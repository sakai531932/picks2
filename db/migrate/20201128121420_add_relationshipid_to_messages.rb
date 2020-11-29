class AddRelationshipidToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :relationship_id, :integer
  end
end
