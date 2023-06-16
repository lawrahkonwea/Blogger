class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(author_id: @user.id, post: @post, text: params[:comment][:text])
    if @comment.save
      redirect_to user_posts_path(@user, @post)
    else
      flash.now[:error] = 'failed to create comment'
      render :new
    end
  end
end
