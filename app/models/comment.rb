class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype
  validates :text, presence: true #空欄でないことを必須にする
end
