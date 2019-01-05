class BooksController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = 'Bookの作成を開始しました。'
      redirect_to new_names_base_periods_path(book_id: @book.id)
    else
      @books = current_user.books.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'Bookの作成開始に失敗しました。'
      render 'books/new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(base_periods_params) # base_periods_paramsに
      flash[:success] = 'Book は正常に更新されました'
      @base_periods = BasePeriod.where(book_id: @book.id)
      redirect_to new_contents_base_periods_path(base_period_id: @base_periods.ids, book_id: @book.id)
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
  
  
  # base_periodsをbookに紐づけて複数保存するためのストロングパラメーター（updateアクション）
  def base_periods_params
    params.require(:book).permit(base_periods_attributes: [:name, :content])
  end
  
end
