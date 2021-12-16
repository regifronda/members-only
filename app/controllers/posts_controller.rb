class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  
  def new
    @post = Post.new
  end
end
