# frozen_string_literal: true

class Admin::PostsController < Admin::ApplicationController
  before_action :set_post, only: %i(edit update destroy)

  def new
    @post = Post.new
    @wip_posts = Post.wip.new_to_old
  end

  def create
    @post = current_admin.posts.build(post_params)
    assign_post_status
    direct_save :new, 'Created'
  end

  def edit;  end

  def update
    @post.assign_attributes post_params
    assign_post_status
    direct_save :edit, 'Updated'
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Deleted!'
  end

  def preview
    render json: { raw_html: markdown_util.render(params[:text]) }
  end

  private

  def post_params
    params.require(:post).permit(:title, :excerpt, :body, :category)
  end

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def direct_save(page, action)
    if @post.save
      redirect_to @post.common? ? post_path(@post) : til_path(@post), notice: "#{action} a new post!"
    else
      flash.now[:alert] = "#{action} post fail!"
      render page
    end
  end

  def assign_post_status
    @post.status = params[:commit] == 'Save' ? :wip : :publish
  end
end
