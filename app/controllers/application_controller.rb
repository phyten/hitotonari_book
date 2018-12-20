class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
 
  #ログイン要求処理
  include SessionsHelper

  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
end
