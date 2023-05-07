class BooksController < ApplicationController
  def index
  end

  def show
  end

  def create
    @books = Book.new
  end

  def edit
  end
end
