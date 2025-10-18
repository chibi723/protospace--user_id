class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :text, null: false # コメント本文
      t.references :user, null: false, foreign_key: true      # 投稿者との関連付け
      t.references :prototype, null: false, foreign_key: true # プロトタイプとの関連付け
      t.timestamps
    end
  end
end
