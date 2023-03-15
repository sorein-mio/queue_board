class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit; end

  def show; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :avatar, :avatar_cache)
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
