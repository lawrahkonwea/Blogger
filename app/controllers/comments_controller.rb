class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(author_id: @user.id, post_id: @post.id, text: params[:comment][:text])

    if @comment.save
      redirect_to user_post_path(@user.id, @post)
      flash.now[:success] = 'comment created'
    else
      flash.now[:error] = 'failed to create comment'
      render :new
    end
  end
end
