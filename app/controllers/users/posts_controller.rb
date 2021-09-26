class Users::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # 受け取った値を,で区切って配列にする
    tag_list=params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      flash[:notice] = "投稿しました"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
    @post_tags = @post.tags
  end

  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(',')
    if @post.user_id == current_user.id
      render :edit
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
      @old_relations = PostTag.where(post_id: @post.id)
      @old_relations.each do |relation|
        relation.delete
      end
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id), notice: "投稿内容を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.page(params[:page]).per(10)
  end


  private
  
  def post_params
    params.require(:post).permit(:user_id, :image, :body)
  end
end
