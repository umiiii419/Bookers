class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/books/:id'
    
    if @book.save
      redirect_to root_path, success: "Book was successfully created."
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
    
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

   def destroy
     book = Book.find(params[:id])
     book.destroy
     redirect_to books_path
   end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
