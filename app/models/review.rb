class Review < ApplicationRecord
  validates :comment, presence: true
  
  belongs_to :user
  belongs_to :profile
  
  enum assessment: [ "Ａ評価", "Ｂ評価", "Ｃ評価", "Ｄ評価" ]
  enum reply: [ "1日以内", "２日以内", "３日以内", "4日以上" ]
  enum continuity: [ "～１０通", "～２０通", "～３０通", "３０通～" ]
end
