class Prototype < ApplicationRecord
  belongs_to :user

  # 画像添付用
  has_one_attached :image
  has_many :comments, dependent: :destroy

  # バリデーション
  validates :title, presence: true        # プロトタイプの名称
  validates :catch_copy, presence: true   # キャッチコピー
  validates :concept, presence: true      # コンセプト
  validates :image, presence: true        # 画像添付が必須
end