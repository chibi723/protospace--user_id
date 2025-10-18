class UsersController < ApplicationController
  def show
    # ユーザーを取得
    @user = User.find(params[:id])
    
    # そのユーザーが投稿したプロトタイプを全て取得
    @prototypes = @user.prototypes.includes(:user)
  end
end