class ProfilesController < ApplicationController
  def index
    @profile = Profile.find_by(user_id: current_user.id)
    @profiles = Profile.where.not(user_id: current_user.id, sex: @profile.sex)
  end
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profiles_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end
  
  def update
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.update_attributes(profile_params)
      redirect_to "/", success: 'プロフィールを更新しました'
    else
      flash.now[:danger] = "更新に失敗しました"
      render action: :edit
    end
    
  end
  
  def destroy
    @profile = Profile.find_by(user_id: current_user.id)
    @profile.destroy
    redirect_to root_path, success: 'プロフィールを削除しました'
  end

  private
  def profile_params
    params.require(:profile).permit(:image, :introduction, :age, :price, :nickname, :sex)
  end
end