class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.all.page(params[:page])
  end

  def search
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'アカウントは正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = 'アカウントは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:success] = 'アカウントは正常に削除されました'
    redirect_to user_url
  end
  
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :birth_date, :password, :password_confirmation)
  end
  
end
