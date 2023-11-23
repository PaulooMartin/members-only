class PostsController < ApplicationController
  before_action :require_log_in, only: [:new, :create]

  def index
    @logged_in = session.has_key?("warden.user.user.key")
    @posts = Post.all
  end

  def create;
  end

  def new;
    @post = Post.new
  end

  private

  def require_log_in
    unless session.has_key?("warden.user.user.key")
      flash[:not_logged_in] = 'You need to sign in before making a post'
      redirect_to new_user_session_path
    end
  end
end
