# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.publish.select(:id, :title, :excerpt, :views_count, :created_at).order(created_at: :desc)
  end

  def show
    @post = Post.publish.find(params[:id])
    unless current_admin
      @post.increment(:views_count)
      @post.save
    end
  end
end
