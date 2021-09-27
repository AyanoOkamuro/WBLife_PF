class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
    @questions = @user.questions.page(params[:page]).reverse_order
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to user_path(@user)
    else
      flash[:alert] = "会員情報を更新できませんでした。記載内容に謝りがある可能性がございます。"
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image, :age)
  end
end
