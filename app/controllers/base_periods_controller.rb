class BasePeriodsController < ApplicationController
  
  def index
    @bp = BasePeriod.all
  end

  def show
    @bp = BasePeriod.find(params[:id])
  end

  def new
    @bp = BasePeriod.new
  end

  def create
    @bp = current_user.base_periods.build(base_period_params)
    if @bp.save
      flash[:success] = 'periodを保存しました。'
      redirect_to root_url
    else
      @bps = current_user.base_periods.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'periodの保存に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    @bp = BasePeriod.find(params[:id])
  end

  def update
    @bp = BasePeriod.find(params[:id])

    if @bp.update(base_period_params)
      flash[:success] = 'period は正常に更新されました'
      redirect_to @base_period
    else
      flash.now[:danger] = 'period は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @bp = BasePeriod.find(params[:id])
    @bp.destroy
    flash[:success] = 'periodを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def base_period_params
    params.require(:base_period).permit(:name, :content)
  end
  
end


