class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    
    #パスワードリセットのメールを送信する
    @user&.deliver_reset_password_instructions!

    #セキュリティ上メールが無くても送信成功を表示させる
    redirect_to login_path, success: t('.success')
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
    return not_authenticated if @user.blank?

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path, success: t('defaults.message.updated', item: User.human_attribute_name(:password))
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.human_attribute_name(:password))
      render :edit
    end
  end
end
