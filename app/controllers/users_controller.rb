class UsersController < ApplicationControlle
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :destroy]
  before_action :allow_only_the_user, only: [:edit, :update, :destroy]
  
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks.order('created_at DESC').page(params[:page])
    
    counts(@user)
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ登録に失敗しました'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    #セッション情報を削除
    session[:user_id] = nill
    
    flash[:success] = 'ユーザは正常に削除されました'
    redirect_to root_url
    
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'ユーザは正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザは更新されませんでした'
      render :edit
  end
  
  private
  
  # ユーザパラメータ取得処理
  def user_params
    params.require(:user).permit(:name, :email, :age, :password, :password_confirmation)
  end
  
  # ログインユーザ以外は、不正なアクセスにする
  def allow_only_the_user
    @user = User.find(params[:id])
    
    unless @user == current_user
      flash[:danger] = '不正なアクセスです'
      redirect_to root_url
    end
    
  end
end
