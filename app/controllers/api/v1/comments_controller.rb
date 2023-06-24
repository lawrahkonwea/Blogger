class Api::V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_post, only: %i[create index]

  def index
    @comments = @post.comments.includes(:author)
    render json: @comments
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.author_id = current_user.id

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessible_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:user_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
