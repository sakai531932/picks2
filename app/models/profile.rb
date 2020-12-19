class Profile < ApplicationRecord
  validates :introduction, presence: true
  validates :image, presence: true
  validates :age, presence: true
  validates :nickname, presence: true
  enum sex: { man: 0, woman: 1}
  
  belongs_to :user
  has_many :reviews
  
  mount_uploader :image, ImageUploader
end
