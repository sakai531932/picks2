class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :active_relationships,  class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  has_many :following_user, through: :active_relationships,  source: :followed
  has_many :follower_user, through: :passive_relationships, source: :follower
  
  has_many :messages, dependent: :destroy
  
  # ユーザーをフォローする
  def follow(user_id)
    active_relationships.create(followed_id: user_id)
  end
  
  # ユーザーのフォローを外す
  def unfollow(user_id)
    active_relationships.find_by(followed_id: user_id).destroy
  end
  
  # フォローしているかどうかの確認をおこなう
  def following?(user)
    following_user.include?(user)
  end
  
end
