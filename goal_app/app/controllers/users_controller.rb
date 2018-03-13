class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    if params[:id] != current_user.id
      flash[:errors] = ["Shouldn't edit other user's info"]
      redirect_to users_url
    end
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to user_url(@user)
    end
  end

  def destroy
    user = User.find(params[:id])
    if user
      user.delete
      redirect_to new_user_url
    else
      flash[:errors] = ["User does't exist"]
      redirect_to users_url
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
