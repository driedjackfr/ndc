# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.select(:id, :title, :excerpt, :created_at).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
