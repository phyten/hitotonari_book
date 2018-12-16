class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = 'Bookを投稿しました。'
      redirect_to root_url
    else
      @books = current_user.books.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'Bookの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:success] = 'Book は正常に更新されました'
      redirect_to @book
    else
      flash.now[:danger] = 'Book は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] = 'Bookを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def book_params
    params.require(:book).permit(:name, :book_photo)
  end
  
end
