class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(current_user.id, @post)
      flash.now[:success] = 'comment created'
    else
      flash.now[:error] = 'failed to create comment'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
