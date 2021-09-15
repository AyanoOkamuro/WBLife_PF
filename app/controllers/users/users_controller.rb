class Users::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = Post.page(params[:page]).reverse_order
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
    flash[:notice] = "更新できました。"
    redirect_to user_path(@user)
    else
    flash[:alert] = "更新できませんでした。記載内容に謝りがある可能性がございます。" 
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
   params.require(:user).permit(:nickname, :email, :profile_image)
  end
  
end
