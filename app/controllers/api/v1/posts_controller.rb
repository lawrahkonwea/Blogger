class Api::V1::PostsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_user, only: %i[create index]

  def index
    @post = @user.posts.includes(:author)

    render json: @post.to_json(include: :comments), status: :success
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
