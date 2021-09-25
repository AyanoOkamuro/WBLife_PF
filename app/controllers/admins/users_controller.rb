class Admins::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_users_path
    else
      redirect_to request.referer, notice:"更新できませんでした"
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :gender, :age, :is_deleted)
  end

end
