class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]


  def index
    @prototypes = Prototype.all.includes(:user)
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit
  end

  def update
     if @prototype.update(prototype_params)
        redirect_to prototype_path(@prototype), notice: "プロトタイプを更新しました！"
    else
      render :edit
    end
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "プロトタイプを投稿しました！"
    else
      # 保存失敗 → もう一度フォームを表示
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path, notice: "プロトタイプを削除しました。"
    else
      redirect_to prototype_path(@prototype), alert: "プロトタイプの削除に失敗しました。"
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    permitted = params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  # 投稿者であるかを確認し、異なればトップページへリダイレクトする
  def contributor_confirmation
    unless @prototype.user == current_user
      redirect_to root_path
    end
  end
end