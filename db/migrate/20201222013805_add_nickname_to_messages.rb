class AddNicknameToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :profile_nickname, :string
  end
end
