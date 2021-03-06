class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit]
  before_action :check_user, only: [:update, :edit]
 
  def show
   @microposts = @user.microposts.order(created_at: :desc)
  end
 
  def new
    @user = User.new
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: '情報を編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
     if @user.save
       flash[:success] = "Welcome to the Sample App!"
       redirect_to @user
     else
       render'new'
     end
  end
 
  private
 
  def set_user
   @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :area)
  end
  
  def check_user
    redirect_to root_url if @user != current_user
  end
end