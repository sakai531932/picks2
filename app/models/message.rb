class Message < ApplicationRecord
  belongs_to :user
  belongs_to :relationship
  default_scope -> { order(created_at: :asc) }
  
  validates :user_id, presence: true
  validates :content, presence: true
end
