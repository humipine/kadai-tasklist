# ■変更内容の説明
# (1) routeの設定を変更したため、redirect先を変更
#
class SessionsController < ApplicationController
  def new
    
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    
    # セッションから取得したemailとpasswordでログインできた場合
    if login(email, password)
      flash[:success] = 'ログインに成功しました'
      @user = current_user
      
      # Edited on 2017/06/29 (1) <<
      # redirect_to @user
      redirect_to tasks_path
      
      # Edited on 2017/06/29 (1) >>
      
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  # ログアウトするとトッフページにリダイレクトする
  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_path
  end
  
  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログインに成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
  

  
end
