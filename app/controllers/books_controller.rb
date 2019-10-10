# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.includes(:post).order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.friendly.review.find(params[:id])
    @book = @post.book
  end
end
