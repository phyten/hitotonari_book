class ToppagesController < ApplicationController
  
  #トップページに自分のbook_photoを表示してbook#showへのリンク設置
  def index
    if logged_in?
      @book = current_user.books.build  # form_for 用

    end
  end
end
