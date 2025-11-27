# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # 新規登録ページ
  def new
    @user = User.new
  end

  # ユーザー作成
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to mypage_path, notice: "登録完了！"
    else
      render :new
    end
  end

  # マイページ
  def show
    # @user は before_action でセット済み
  end

  # プロフィール編集ページ
  def edit
  end

  # プロフィール更新
  def update
    if @user.update(user_params)
      redirect_to mypage_path, notice: "プロフィールを更新しました"
    else
      render :edit
    end
  end

  # ユーザー削除
  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "アカウントを削除しました"
  end

  private

  # 強制的にログインユーザーだけにする場合
  def set_user
    @user = current_user || User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # current_user メソッドがない場合は追加
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
