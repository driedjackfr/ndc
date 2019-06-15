# frozen_string_literal: true

class Admin::PostsController < Admin::ApplicationController
  before_action :set_post, only: %i(edit update destroy)

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

  def edit;  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Updated the post!'
    else
      flash.new[:alert] = 'Update post fail!'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :excerpt, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
