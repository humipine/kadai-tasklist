class TasksController < ApplicationController
  # Added on 2017/06/12 -- 共通化処理 (before_action) <
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy]
  # Added on 2017/06/12 -- 共通化処理 (before_action) >
  
  def index
    # Taskﾃｰﾌﾞﾙの全てのﾚｺｰﾄﾞを@taskｲﾝｽﾀﾝｽ変数に設定
    # View側で、この変数を利用して画面にﾃﾞｰﾀを表示する
    # @tasks = Task.all
    # if logged_in?
    if logged_in?
      @tasks = current_user.tasks.page(params[:page])
      @user = current_user
      
    else
      # @taks = nil
    end
  end
  
  def show
    # 画面から渡されたIDをパラメータとしてデータベースから
    # 該当するレコードを抽出し
    # @task
    
    # 2. Edited on 2017/06/12 -- before_action に変更 <<<
    # 1. Edited on 2017/06/12 -- 共通化処理に変更 <<
    # @task = Task.find(params[:id]) #1
    # set_task #2
    
    # Edited on 2017/06/12 -- 共通化処理に変更 >>
    # Edited on 2017/06/12 -- before_action に変更 >>>
    
  end
  
  def new
    # @task = current_user.Task.new(content: '', status: '')
    # @task = current_user.tasks.new(content: '', status: '')
    @task = current_user.tasks.build(content: '', status: '')
    @user = current_user
    
  end
  
  def create
    
    # @task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'Taskが正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが登録されませんでした'
      render :new
    end
    
  end
  
  def edit
    # 2. Edited on 2017/06/12 -- before_action に変更 <<<
    # 1. Edited on 2017/06/12 -- 共通化処理に変更 <<
    # @task = Task.find(params[:id]) #1
    # set_task #2
    
    # Edited on 2017/06/12 -- 共通化処理に変更 >>
    # Edited on 2017/06/12 -- before_action に変更 >>>
    
  end
  
  def update
    # 2. Edited on 2017/06/12 -- before_action に変更 <<<
    # 1. Edited on 2017/06/12 -- 共通化処理に変更 <<
    # @task = Task.find(params[:id]) #1
    # set_task #2
    # Edited on 2017/06/12 -- 共通化処理に変更 >>
    # Edited on 2017/06/12 -- before_action に変更 >>>
    
    if @task.update(task_params)
      flash[:success] = 'Taskは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    # 2. Edited on 2017/06/12 -- before_action に変更 <<<
    # 1. Edited on 2017/06/12 -- 共通化処理に変更 <<
    # @task = Task.find(params[:id]) #1
    # set_task #2
    # Edited on 2017/06/12 -- 共通化処理に変更 >>
    # Edited on 2017/06/12 -- before_action に変更 >>>
    
    @task.destroy
    
    flash[:success] = 'Taskは正常に削除されました'
    redirect_to root_path
    
  end
  
  private
  
  def set_task
    # @task = current_user.tasks.find(params[:id])
    @task = current_user.tasks.find_by_id(params[:id])
    
    if @task == nil
      redirect_to root_url
    end
  end
  
  # Strong Parameter
  def task_params
    # Edit, 2017/06/12 - カラム「status」の追加によるパラメータからのstatus取得の追加 <<>>
    params.require(:task).permit(:content, :status)
    # params.require(:m01_status).permit(:m01_status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
end