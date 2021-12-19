class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to index
    else
      render :new
    end
  end
  

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section."
      redirect_to root_url
    end
  end

  def post_params
    params.require(:user).permit(:title,:body)
  end
end
