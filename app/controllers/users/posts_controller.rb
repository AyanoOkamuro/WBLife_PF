class Users::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to post_path(@post.id)
    else
      @post = Post.all
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    # @book_comment = BookComment.new
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      render :edit
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "編集しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:user_id, :image, :body)
  end
end