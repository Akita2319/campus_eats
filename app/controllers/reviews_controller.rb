class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_shop
  before_action :set_review, only: %i[edit update destroy]

  # レビュー投稿
  def create
    @review = @shop.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @shop, notice: "レビューを投稿しました"
    else
      redirect_to @shop, alert: "投稿に失敗しました"
    end
  end

  # レビュー編集画面
  def edit
    # @review は before_action で取得済み
  end

  # レビュー更新
  def update
    if @review.update(review_params)
      redirect_to @shop, notice: "レビューを更新しました"
    else
      render :edit, alert: "更新に失敗しました"
    end
  end

  # レビュー削除
  def destroy
    @review.destroy
    redirect_to @shop, notice: "レビューを削除しました"
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
