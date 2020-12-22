class AddNicknameToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :profile_nickname, :string
  end
end
