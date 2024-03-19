class BooksController < ApplicationController
  # def show_all
  #   @books = Book.all
  # end
  # def show_all
  #   @books = Book.includes(:magazines).page(params[:page]).per(10)
  # end
  # Adding search function 
  def show_all
    if params[:search].present?
      @books = Book.includes(:magazines).where("title LIKE ?", "%#{params[:search]}%").page(params[:page]).per(10)
      if @books.empty?
        flash.now[:notice] = "Sorry, no results found."
      end
    else
      @books = Book.includes(:magazines).page(params[:page]).per(10)
    end
  end
  def show
    @book = Book.includes(:magazines).find(params[:id])
  end
end
