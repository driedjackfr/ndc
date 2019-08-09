# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.publish.common
                 .select(:id, :title, :excerpt, :views_count, :created_at, :slug, :comments_count)
                 .new_to_old.page(params[:page])
  end

  def show
    @post = Post.friendly.common.find(params[:id])
    @post.increment!(:views_count) unless current_admin
    # @comments = @post.comments
  end
end
