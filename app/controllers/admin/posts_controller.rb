# frozen_string_literal: true

class Admin::PostsController < Admin::ApplicationController
  def new
    @post = Post.new
  end

  def create
    if @post = current_admin.posts.create(post_params)
      redirect_to post_path(@post), notice: 'Created a new post!'
    else
      flash.new[:alert] = 'Create post fail!'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :excerpt, :body)
  end
end
