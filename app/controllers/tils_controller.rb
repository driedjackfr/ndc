# frozen_string_literal: true

class TilsController < ApplicationController
  def index
    @posts = Post.publish.til.select(:id, :title, :created_at, :slug).order(created_at: :desc)
  end

  def show
    @post = Post.friendly.til.find(params[:id])
  end

  def today
    if params[:prev].present?
      @prev = params[:prev].to_i + 1
      @post = Post.publish.til.order(created_at: :desc).offset(params[:prev].to_i).first
      @is_eldest = Post.til.count == @prev
    else
      @post = Post.publish.til.last
      @prev = 1
    end
  end
end
