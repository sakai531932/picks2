class ReviewsController < ApplicationController
  def show
    @revies = Review.all(profile_id: profile.id)
  end
  
  def new
    @review = Review.new
    @profile = Profile.find_by(user_id: params[:followed_id])
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to profiles_path, success: 'レビューが投稿されました'
    else
      flash.now[:danger] = "レビューに失敗しました"
      render :new
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:comment, :value, :continuity, :reply, :profile_id).merge(user_id: current_user.id)
  end
end
