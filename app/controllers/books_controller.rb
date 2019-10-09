# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.order(created_at: :desc).page(params[:page])
  end
end
