class UserSessionsController < ApplicationController
    skip_before_action :require_login, only: %i[new create]

    def new
        @user = User.new
    end

    def create
        @user = login(params[:email], params[:password])
        if @user
            redirect_back_or_to boards_path, success: t('.success')
        else
            flash.now[:danger] = t('.aleat')
            render :new
        end
    end

    def destroy
        logout
        redirect_to root_path, success: t('.success')
    end

end
