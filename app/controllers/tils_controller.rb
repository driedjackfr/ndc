# frozen_string_literal: true

class TilsController < ApplicationController
  def index
    @posts = Post.til.select(:id, :title, :created_at).order(created_at: :desc)
  end

  def show
    @post = Post.til.find(params[:id])
  end

  def today
    @post = Post.til.last
  end
end
