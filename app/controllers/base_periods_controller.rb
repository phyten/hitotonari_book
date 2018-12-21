class BasePeriodsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
     @base_periods = BasePeriod.all
  end

  def show
    @base_period = BasePeriod.find(params[:id])
  end

  
  def new_names
    @base_period = Book.find(params[:book_id]).base_periods.build
  end
  
  def new_contents
    @base_period = BasePeriod.new
    @base_period = BasePeriod.find_by(id: params[:format])
  end


  def create
    @book = Book.find(params[:book_id])
    @base_period = @book.base_periods.build(base_period_params)
    if @base_period.save
      flash[:success] = 'period.nameを保存しました。'
      redirect_to new_contents_base_periods_path(@base_period)
    else
      @base_periods= @book.base_periods.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'period.nameの保存に失敗しました。'
      render 'toppages/index'
    end
  end


  def edit
    @base_period = BasePeriod.find(params[:id])
  end

  def update
    @base_period = BasePeriod.find(params[:id])

    if @base_period.update(base_period_params)
      flash[:success] = 'period は正常に更新されました'
      redirect_to @base_period
    else
      flash.now[:danger] = 'period は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @base_period = BasePeriod.find(params[:id])
    @base_period.destroy
    flash[:success] = 'periodを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def base_period_params
    params.require(:base_period).permit(:name, :content)
  end
  
end


