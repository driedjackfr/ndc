# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.publish.common.select(:id, :title, :excerpt, :views_count, :created_at, :slug)
                 .new_to_old.page(params[:page])
  end

  def show
    @post = Post.friendly.common.find(params[:id])
    unless current_admin
      @post.increment(:views_count)
      @post.save
    end
  end
end
