class PostsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @user = User.includes(:posts, :comments).find(params[:user_id])
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to "/users/#{current_user.id}/posts" }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy
    redirect_to "/users/#{current_user.id}/posts", notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
