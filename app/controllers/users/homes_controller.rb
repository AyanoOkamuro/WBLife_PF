class Users::HomesController < ApplicationController
  def top
    @posts = Post.order("created_at DESC").page(params[:page]).per(4)
  end

  def about
  end
end
