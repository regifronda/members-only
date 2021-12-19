class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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
