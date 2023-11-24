class PostsController < ApplicationController
  before_action :require_log_in, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
  end

  private

  def require_log_in
    unless session.has_key?("warden.user.user.key")
      flash[:not_logged_in] = 'You need to sign in before making a post'
      redirect_to new_user_session_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
